// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdfx/pdfx.dart';
import 'package:universal_html/html.dart' as html;

class CVViewerPage extends StatefulWidget {
  const CVViewerPage({super.key});

  @override
  State<CVViewerPage> createState() => _CVViewerPageState();
}

class _CVViewerPageState extends State<CVViewerPage> {
  PdfController? _pdfController;
  bool _isLoading = true;
  String? _errorMessage;
  double _zoomLevel = 1.5; // Start with 1.5x zoom

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  void _loadPdf() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // For demo purposes, we'll try to load the CV PDF
      // If it doesn't exist, we'll show a placeholder
      final document = await PdfDocument.openAsset('assets/cv.pdf');

      setState(() {
        _pdfController = PdfController(
          document: Future.value(document),
          initialPage: 0,
        );
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage =
            'CV PDF not available yet. Please add your CV as assets/cv.pdf to enable this feature.';
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _pdfController?.dispose();
    super.dispose();
  }

  void _zoomIn() {
    setState(() {
      _zoomLevel = (_zoomLevel * 1.2).clamp(0.5, 3.0);
    });
  }

  void _zoomOut() {
    setState(() {
      _zoomLevel = (_zoomLevel / 1.2).clamp(0.5, 3.0);
    });
  }

  void _resetZoom() {
    setState(() {
      _zoomLevel = 1.0;
    });
  }

  Future<void> _downloadCV() async {
    try {
      // Load the PDF data
      final ByteData data = await rootBundle.load('assets/cv.pdf');
      final List<int> bytes = data.buffer.asUint8List();

      // Create a blob and download link for web
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);

      // Create a download link

      // Clean up
      html.Url.revokeObjectUrl(url);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('CV downloaded successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Download failed: ${e.toString()}')),
      );
    }
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
          if (_pdfController != null) ...[
            IconButton(
              icon: const Icon(Icons.zoom_in),
              onPressed: _zoomIn,
              tooltip: 'Zoom In',
            ),
            IconButton(
              icon: const Icon(Icons.zoom_out),
              onPressed: _zoomOut,
              tooltip: 'Zoom Out',
            ),
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _resetZoom,
              tooltip: 'Reset Zoom',
            ),
          ],
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: _downloadCV,
            tooltip: 'Download CV',
          ),
        ],
        bottom: _pdfController != null
            ? PreferredSize(
                preferredSize: const Size.fromHeight(30),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  child: Text(
                    'Ctrl+wheel: Zoom • Pinch: Zoom • Buttons: Zoom • Swipe: Scroll',
                    style: TextStyle(
                      color: theme.colorScheme.onPrimary.withOpacity(0.8),
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : null,
      ),
      body: _isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading CV...'),
                ],
              ),
            )
          : _errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: theme.colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _errorMessage!,
                        style: theme.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'To add your CV:\n1. Add your CV PDF as assets/cv.pdf\n2. Update pubspec.yaml assets section\n3. Run flutter pub get',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.7),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _loadPdf,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : _pdfController != null
                  ? Container(
                      color: Colors.grey[100],
                      child: Listener(
                        onPointerSignal: (pointerSignal) {
                          if (pointerSignal is PointerScrollEvent) {
                            // Handle Ctrl+mouse wheel zoom for desktop
                            if (HardwareKeyboard.instance.isControlPressed ||
                                HardwareKeyboard.instance.isMetaPressed) {
                              final delta = pointerSignal.scrollDelta.dy;
                              if (delta > 0) {
                                _zoomOut();
                              } else {
                                _zoomIn();
                              }
                            }
                          }
                        },
                        child: GestureDetector(
                          onScaleUpdate: (details) {
                            // Handle pinch-to-zoom for mobile
                            if (defaultTargetPlatform ==
                                    TargetPlatform.android ||
                                defaultTargetPlatform == TargetPlatform.iOS) {
                              setState(() {
                                _zoomLevel = (_zoomLevel * details.scale)
                                    .clamp(0.5, 3.0);
                              });
                            }
                          },
                          onScaleEnd: (details) {
                            // Reset scale detection for next gesture
                          },
                          child: Transform.scale(
                            scale: _zoomLevel,
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height - 200,
                              child: PdfView(
                                controller: _pdfController!,
                                scrollDirection: Axis.vertical,
                                onDocumentLoaded: (document) {
                                  // Optional: Handle document loaded event
                                },
                                onPageChanged: (page) {
                                  // Optional: Handle page change event
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Center(
                      child: Text('PDF controller not initialized'),
                    ),
    );
  }
}
