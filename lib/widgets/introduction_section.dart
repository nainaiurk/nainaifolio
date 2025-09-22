import 'package:flutter/material.dart';
import '../utils/responsive.dart';

/// Responsive “Introduction” section:
/// - Desktop: full text shown.
/// - Mobile & Tablet: collapsed preview with “See more / See less”.
class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  static const String _aboutTitle = "Hi, I'm Nainaiu Rakhaine,";

  // Keep your original text as-is; we'll normalize it at render time.
  static const String _aboutText = '''
A dedicated Electrical and Electronic Engineering graduate from Shahjalal University of Science and Technology, Sylhet, with a strong foundation in embedded systems, IoT technologies, and autonomous systems. Currently pursuing advanced research in autonomous vehicles and intelligent sensing platforms, I combine academic excellence with practical engineering experience.

My expertise spans embedded systems, IoT development, autonomous vehicle technology, and technical communication. I've successfully deployed multiple IoT solutions including biometric attendance systems and environmental monitoring networks, while contributing to Bangladesh's first Level 2 autonomous vehicle initiative.

With proficiency in Python, Flutter, microcontroller programming, and PCB design, I bridge the gap between hardware and software domains. My work demonstrates versatility across TinyML implementations, RTOS-based systems, and modern mobile development frameworks.

I'm passionate about turning innovative ideas into practical engineering solutions and always eager to tackle complex challenges that push technological boundaries.
Research interests include: wearable sensing systems, ultra-low-power IoT devices, and TinyML-powered embedded intelligence for health, environment, and mobility applications.
''';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).cardColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Responsive(
        mobile: _IntroContent(
          titleFontSize: 16,
          bodyFontSize: 12,
          collapsedParagraphs: 2, // show 2 paragraphs, then “See more”
          isCollapsible: true,
        ),
        tablet: _IntroContent(
          titleFontSize: 24,
          bodyFontSize: 15,
          collapsedParagraphs: 3,
          isCollapsible: true,
        ),
        desktop: _IntroContent(
          titleFontSize: 36,
          bodyFontSize: 18,
          collapsedParagraphs: null, // null -> show all
          isCollapsible: false,
        ),
      ),
    );
  }
}

class _IntroContent extends StatefulWidget {
  const _IntroContent({
    required this.titleFontSize,
    required this.bodyFontSize,
    required this.collapsedParagraphs,
    required this.isCollapsible,
  });

  final double titleFontSize;
  final double bodyFontSize;
  final int? collapsedParagraphs; // when null, show all paragraphs
  final bool isCollapsible;

  @override
  State<_IntroContent> createState() => _IntroContentState();
}

class _IntroContentState extends State<_IntroContent> {
  bool _expanded = false;

  // Normalize your text:
  // - Collapse multiple blank lines to a single blank line
  // - Trim leading/trailing whitespace
  // - Split into meaningful paragraphs
  List<String> _normalizedParagraphs(String raw) {
    final collapsed = raw
        .replaceAll(RegExp(r'\r\n'), '\n')
        .replaceAll(RegExp(r'\n[ \t]*\n+'),
            '\n\n') // collapse 2+ blank lines to exactly one
        .trim();
    final parts = collapsed
        .split('\n\n')
        .map((p) => p.trim())
        .where((p) => p.isNotEmpty)
        .toList();
    return parts;
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).textTheme.bodyMedium?.color;
    final paragraphs = _normalizedParagraphs(IntroductionSection._aboutText);

    // Decide how many paragraphs to show when collapsed
    final showAll = !widget.isCollapsible ||
        _expanded ||
        widget.collapsedParagraphs == null;
    final toShowCount = showAll
        ? paragraphs.length
        : widget.collapsedParagraphs!.clamp(0, paragraphs.length);
    final visibleParas = paragraphs.take(toShowCount).toList();

    // Tight, consistent spacing between paragraphs
    final paragraphGap = (widget.bodyFontSize * 0.75).clamp(6, 16).toDouble();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          IntroductionSection._aboutTitle,
          style: TextStyle(
            fontSize: widget.titleFontSize,
            fontWeight: FontWeight.bold,
            color: color,
            fontFamily: 'FontAwesome', // kept from your sample
            height: 1.2, // slightly tighter title line-height
          ),
          textAlign: TextAlign.start,
          textHeightBehavior: const TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
        ),
        const SizedBox(height: 12),

        // Body as paragraphs (tight line-height + controlled paragraph gap)
        ...List.generate(visibleParas.length, (i) {
          final isLast = i == visibleParas.length - 1;
          return Padding(
            padding: EdgeInsets.only(bottom: isLast ? 0 : paragraphGap),
            child: Text(
              visibleParas[i],
              style: TextStyle(
                fontSize: widget.bodyFontSize,
                color: color,
                fontFamily: 'FontAwesome',
                height: 1.35, // tighter line-height (adjust 1.30–1.45 to taste)
              ),
              textAlign: TextAlign.start,
              softWrap: true,
              strutStyle: StrutStyle(
                fontSize: widget.bodyFontSize,
                height: 1.35,
                leading: 0,
                forceStrutHeight: false,
              ),
              textHeightBehavior: const TextHeightBehavior(
                applyHeightToFirstAscent: false,
                applyHeightToLastDescent: false,
              ),
            ),
          );
        }),

        // See more / See less (only when collapsible)
        if (widget.isCollapsible &&
            paragraphs.length >
                (widget.collapsedParagraphs ?? paragraphs.length)) ...[
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () => setState(() => _expanded = !_expanded),
            icon: Icon(_expanded
                ? Icons.keyboard_arrow_up
                : Icons.keyboard_arrow_down),
            label: Text(_expanded ? 'See less' : 'See more'),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],

        const SizedBox(height: 20),

        // Learn more button (kept from your sample)
        // Subtle scroll indicator (text only, no button)
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              "↓ Learn More Below",
              style: TextStyle(
                fontSize: widget.bodyFontSize - 2,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
