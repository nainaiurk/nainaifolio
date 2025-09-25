// PDF rendering view: render each PDF page to an image sized for the current
// layout and display them stacked. This preserves the exact visual of the CV PDF
// while keeping the page responsive and scrollable.
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle, RawKeyboard, LogicalKeyboardKey;
import 'dart:io' show File, Directory, Platform;
import 'package:pdfx/pdfx.dart';
import 'dart:math' as math;
import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:universal_html/html.dart' as html;

class CVViewerPage extends StatefulWidget {
  const CVViewerPage({super.key});

  @override
  State<CVViewerPage> createState() => _CVViewerPageState();
}

class _CVViewerPageState extends State<CVViewerPage> {
  Future<List<Uint8List>>? _pagesFuture;
  double? _lastRequestedWidth;
  List<TransformationController> _controllers = [];
  // per-page keys so web wheel handler can find the page under cursor
  List<GlobalKey> _pageKeys = [];
  // web-only wheel subscription
  StreamSubscription? _wheelSub;

  Future<void> _downloadPdf() async {
    try {
      final data = await rootBundle.load('assets/cv.pdf');
      final bytes = data.buffer.asUint8List();

      if (kIsWeb) {
        // Use an anchor + blob to trigger download in web
        final blob = html.Blob([bytes], 'application/pdf');
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.document.createElement('a') as html.AnchorElement;
        anchor.href = url;
        anchor.download = 'Nainaiu_Rakhaine_cv.pdf';
        anchor.style.display = 'none';
        html.document.body?.append(anchor);
        anchor.click();
        anchor.remove();
        html.Url.revokeObjectUrl(url);
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Download started')));
        return;
      }

      // Non-web platforms: write to system temp and offer to open
      final tmp = Directory.systemTemp;
      final file = File(
          '${tmp.path}${Platform.pathSeparator}Nainaiu_Rakhaine_cv_${DateTime.now().millisecondsSinceEpoch}.pdf');
      await file.writeAsBytes(bytes);

      final uri = Uri.file(file.path);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Saved to ${file.path}'),
          action: SnackBarAction(
            label: 'Open',
            onPressed: () async {
              try {
                if (!await launchUrl(uri)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not open file')));
                }
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Open failed: $e')));
              }
            },
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Failed to download: $e')));
    }
  }

  Future<List<Uint8List>> _renderPagesForWidth(double layoutWidth) async {
    // Render pages at device pixel ratio to keep text crisp
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    final targetWidth =
        (layoutWidth * devicePixelRatio).clamp(100, 4000).toInt();

    final doc = await PdfDocument.openAsset('assets/cv.pdf');
    final count = doc.pagesCount;
    final List<Uint8List> images = [];

    for (var i = 1; i <= count; i++) {
      final page = await doc.getPage(i);
      try {
        // compute height preserving aspect ratio
        final pw = page.width;
        final ph = page.height;
        final scale = targetWidth / pw;
        final renderHeight = (ph * scale).toInt();

        final pageImage = await page.render(
          width: targetWidth.toDouble(),
          height: renderHeight.toDouble(),
          format: PdfPageImageFormat.jpeg,
        );
        if (pageImage != null) images.add(pageImage.bytes);
      } finally {
        await page.close();
      }
      // yield a small delay so UI can update if needed
      await Future.delayed(const Duration(milliseconds: 8));
    }

    await doc.close();
    return images;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My CV'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        elevation: 0,
        actions: [
          IconButton(
            tooltip: 'Download PDF',
            icon: const Icon(Icons.download_rounded),
            onPressed: _downloadPdf,
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        final layoutWidth =
            kIsWeb ? constraints.maxWidth * 0.9 : constraints.maxWidth;
        final contentWidth = layoutWidth.clamp(0.0, 1000.0);

        // Only re-render when width changes significantly
        if (_pagesFuture == null ||
            (_lastRequestedWidth == null) ||
            (_lastRequestedWidth! - contentWidth).abs() > 2) {
          _lastRequestedWidth = contentWidth;
          _pagesFuture = _renderPagesForWidth(contentWidth);
        }

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: contentWidth),
            child: FutureBuilder<List<Uint8List>>(
              future: _pagesFuture,
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snap.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('Failed to load CV PDF: ${snap.error}'),
                    ),
                  );
                }
                final pages = snap.data ?? [];
                if (pages.isEmpty) {
                  return const Center(child: Text('CV not available'));
                }

                // Ensure controllers and keys match pages count
                if (_controllers.length != pages.length) {
                  for (final c in _controllers) {
                    c.dispose();
                  }
                  _controllers = List.generate(pages.length, (_) => TransformationController());
                }
                if (_pageKeys.length != pages.length) {
                  _pageKeys = List.generate(pages.length, (_) => GlobalKey());
                }

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: pages.asMap().entries.map((entry) {
                      final i = entry.key;
                      final bytes = entry.value;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: LayoutBuilder(builder: (context, box) {
                          // Use InteractiveViewer for pinch-to-zoom and panning
                          // Wrap page in a Listener for non-web pointer scroll events
                          return Listener(
                            onPointerSignal: (ps) {
                              if (ps is PointerScrollEvent) {
                                // require Ctrl key for scroll-to-zoom on non-web
                                final keys = RawKeyboard.instance.keysPressed;
                                final isCtrl = keys.contains(LogicalKeyboardKey.controlLeft) ||
                                    keys.contains(LogicalKeyboardKey.controlRight);
                                if (!isCtrl) return;

                                final controller = _controllers[i];
                                final currentScale = controller.value.getMaxScaleOnAxis();
                                final factor = math.pow(1.001, -ps.scrollDelta.dy);
                                final newScale = (currentScale * factor).clamp(0.5, 6.0);
                                controller.value = Matrix4.identity()..scale(newScale);
                              }
                            },
                            child: ConstrainedBox(
                            key: _pageKeys[i],
                              constraints: BoxConstraints(maxWidth: contentWidth),
                              child: InteractiveViewer(
                                transformationController: _controllers[i],
                                panEnabled: true,
                                scaleEnabled: true,
                                minScale: 0.5,
                                maxScale: 6.0,
                                boundaryMargin: const EdgeInsets.all(20),
                                child: Image.memory(
                                  bytes,
                                  fit: BoxFit.fitWidth,
                                  width: contentWidth,
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      // On web, listen to raw wheel events and apply zoom to the page under cursor
      _wheelSub = html.window.onWheel.listen((html.WheelEvent ev) {
        // Require the keyboard state (RawKeyboard) to report ctrl/meta pressed.
        final keys = RawKeyboard.instance.keysPressed;
        final isCtrlPressed = keys.contains(LogicalKeyboardKey.controlLeft) ||
            keys.contains(LogicalKeyboardKey.controlRight) ||
            keys.contains(LogicalKeyboardKey.metaLeft) ||
            keys.contains(LogicalKeyboardKey.metaRight);
        if (!isCtrlPressed) return;

        // Find the page under the cursor
        final px = ev.client.x.toDouble();
        final py = ev.client.y.toDouble();

        for (var i = 0; i < _pageKeys.length; i++) {
          final key = _pageKeys[i];
          final ctx = key.currentContext;
          if (ctx == null) continue;
          final box = ctx.findRenderObject() as RenderBox;
          final pos = box.localToGlobal(Offset.zero);
          final rect = pos & box.size;
          if (rect.contains(Offset(px, py))) {
            final controller = _controllers[i];
            final currentScale = controller.value.getMaxScaleOnAxis();
            final factor = math.pow(1.001, -ev.deltaY);
            final newScale = (currentScale * factor).clamp(0.5, 6.0);
            controller.value = Matrix4.identity()..scale(newScale);
            break;
          }
        }
      });
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    _wheelSub?.cancel();
    super.dispose();
  }
}
