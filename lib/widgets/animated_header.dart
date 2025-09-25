// Drop-in header that prevents layout shifting by giving the typewriter line
// a fixed width equal to the final text width. Image always left, text right.
// Requires: animated_text_kit, google_fonts, font_awesome_flutter, url_launcher

import 'dart:math' as math;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Using locally bundled fonts; avoid runtime Google Fonts fetches for faster first load.
import 'package:url_launcher/url_launcher.dart';

class AnimatedHeader extends StatelessWidget {
  const AnimatedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final media = MediaQuery.of(context);
      final w = c.maxWidth.isFinite ? c.maxWidth : media.size.width;
      final h = c.maxHeight.isFinite && c.maxHeight > 0
          ? c.maxHeight
          : media.size.height;

      final isMobile = w < 700;
      final isTablet = w >= 700 && w < 1100;

      double remBase = (w < h ? w : h) * 0.01; // base scale
      remBase = remBase.clamp(8, 18);
      double rem(double n) => n * remBase;
      double clamp(double v, double min, double max) =>
          v < min ? min : (v > max ? max : v);

      // === YOUR ORIGINAL SIZE MATH (unchanged) ===
      final titleSize = clamp(
          rem(isMobile
              ? 0.08
              : isTablet
                  ? 2
                  : 3),
          9,
          30);
      final subtitleSize = clamp(
          rem(isMobile
              ? 1.4
              : isTablet
                  ? 2.2
                  : 3),
          10,
          28);
      final nameSize = clamp(
          rem(isMobile
              ? 1.5
              : isTablet
                  ? 4.0
                  : 6),
          17,
          56);
      double icon(double n) => clamp(
          rem(isMobile
              ? n
              : isTablet
                  ? n * 2
                  : n * 3),
          20,
          70);

      final primary = Theme.of(context).colorScheme.primary;
      final bodyColor = Theme.of(context).textTheme.bodyMedium?.color ??
          const Color.fromARGB(221, 127, 42, 42);

      // Extra gap below any AppBar — YOUR VALUES (unchanged)
      final extraTop = rem(isMobile
          ? 10.0
          : isTablet
              ? 8.5
              : 7.0);

      return Container(
        color: Colors.transparent,
        width: double.infinity,
        padding: EdgeInsets.only(
          top: extraTop,
          bottom: rem(
            isMobile
                ? 0.0
                : isTablet
                    ? 1.8
                    : 3.0,
          ),
        ),
        child: SafeArea(
          top: true,
          bottom: false,
          child: Row(
            // align left/right cleanly without stretching
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // LEFT: Portrait (YOUR WIDTH/HEIGHT PERCENTAGES)
              Container(
                alignment: Alignment.centerLeft,
                height: isMobile
                    ? h * 0.25
                    : isTablet
                        ? h * 0.4
                        : h * 0.7,
                width: isMobile
                    ? w * 0.45
                    : isTablet
                        ? w * 0.45
                        : w * 0.4,
                child: const AspectRatio(
                  aspectRatio: 1,
                  child: Image(
                    image: AssetImage('assets/images/me.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              SizedBox(width: rem(1.0)),

              // RIGHT: Text column (YOUR WIDTH/HEIGHT PERCENTAGES)
              Container(
                color: Colors.transparent,
                alignment: Alignment.centerRight,
                width: isMobile
                    ? w * 0.45
                    : isTablet
                        ? w * 0.48 - rem(1.0)
                        : w * 0.4 - rem(1.2),
                height: isMobile
                    ? h * 0.25
                    : isTablet
                        ? h * 0.4
                        : h * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.end, // like your earlier rhythm
                  children: [
                    // CV Button
                    Center(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/cv');
                        },
                        icon: Icon(
                          Icons.description,
                          // further reduce icon size on mobile
                          size: isMobile ? icon(0.12) : icon(1.0),
                        ),
                        label: Text(
                          'View My CV',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            // slightly smaller font on mobile
                            fontSize: isMobile
                                ? (titleSize - 0.7)
                                : (titleSize - 0.5),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          // Keep font size unchanged; only reduce the vertical
                          // padding (container height) on mobile.
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile
                                ? rem(0.45)
                                : isTablet
                                    ? rem(1.2)
                                    : rem(1.5),
                            // even smaller vertical padding on mobile to further reduce height
                            vertical: isMobile
                                ? rem(0.12)
                                : isTablet
                                    ? rem(0.8)
                                    : rem(1.0),
                          ),
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 1),
                          foregroundColor: primary,
                          backgroundColor: primary.withOpacity(0.06),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                isMobile ? rem(0.7) : rem(1.2)),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: isMobile
                          ? rem(1)
                          : isTablet
                              ? rem(2.0)
                              : rem(5.6),
                    ),

                    // Hello + wave gif
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Hello:)',
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.w600,
                            color: bodyColor,
                          ),
                        ),
                        SizedBox(width: rem(0.6)),
                        Image.asset(
                          'assets/gif/hand_wave.gif',
                          height: icon(1.8),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: isMobile
                          ? rem(0.2)
                          : isTablet
                              ? rem(1.2)
                              : rem(1.0),
                    ),

                    // *** FIXED-WIDTH TYPEWRITER (no layout shift) ***
                    SizedBox(
                      height: subtitleSize * 1.1,
                      width: double.infinity,
                      child: FixedWidthTypewriter(
                        fullText: "Welcome to Nainai's Portfolio",
                        textStyle: TextStyle(
                          fontSize: subtitleSize,
                          color: primary,
                          fontWeight: FontWeight.w600,
                        ),
                        speed: const Duration(milliseconds: 100),
                        pause: const Duration(milliseconds: 1000),
                      ),
                    ),

                    SizedBox(
                      height: isMobile
                          ? rem(1.5)
                          : isTablet
                              ? rem(1.6)
                              : rem(2.6),
                    ),

                    // Name (two lines)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NAINAIU',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: nameSize,
                            color: primary,
                            fontWeight: FontWeight.w300,
                            letterSpacing: isMobile
                                ? 1.2
                                : isTablet
                                    ? 1.35
                                    : 1.5,
                          ),
                        ),
                        SizedBox(
                          height: isMobile
                              ? rem(0.1)
                              : isTablet
                                  ? rem(0.2)
                                  : rem(0.2),
                        ),
                        Text(
                          'RAKHAINE',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: nameSize,
                            color: primary,
                            fontWeight: FontWeight.w700,
                            letterSpacing: isMobile
                                ? 1.6
                                : isTablet
                                    ? 1.8
                                    : 2.0,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: isMobile
                          ? rem(0.6)
                          : isTablet
                              ? rem(2.4)
                              : rem(4.0),
                    ),

                    // Socials (row; wrap if tight)
                    LayoutBuilder(builder: (context, cc) {
                      final icons = [
                        _social(
                            primary,
                            FontAwesomeIcons.facebook,
                            'https://www.facebook.com/nainaiu.rk1234/',
                            icon(2.2)),
                        _social(
                            primary,
                            FontAwesomeIcons.linkedin,
                            'https://www.linkedin.com/in/nainaiu-rakhaine',
                            icon(2.2)),
                        _social(primary, FontAwesomeIcons.twitter,
                            'https://x.com/nainaiu_rk', icon(2.2)),
                        _social(primary, FontAwesomeIcons.github,
                            'https://github.com/nainaiurk', icon(2.2)),
                      ];
                      if (cc.maxWidth < 320) {
                        return Wrap(
                          spacing: isMobile
                              ? rem(0.36)
                              : isTablet
                                  ? rem(2.6)
                                  : rem(5.0),
                          runSpacing: isMobile ? rem(0.2) : rem(0.4),
                          children: icons,
                        );
                      }
                      return Row(
                        children: icons
                            .expand((w) => [
                                  w,
                                  SizedBox(
                                    width: isMobile
                                        ? rem(0.36)
                                        : isTablet
                                            ? rem(2.6)
                                            : rem(5.0),
                                  ),
                                ])
                            .toList()
                          ..removeLast(),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _social(Color color, IconData iconData, String url, double size) {
    return IconButton(
      onPressed: () => _launchURL(url),
      icon: Icon(iconData),
      iconSize: size,
      color: color,
      tooltip: url,
    );
  }
}

/// A wrapper around AnimatedTextKit's Typewriter that pre-measures the final text width
/// and constrains the line to that width from the beginning. This prevents parent Row/Column
/// from re-laying out as characters are added, eliminating image/container shifting.
class FixedWidthTypewriter extends StatelessWidget {
  const FixedWidthTypewriter({
    super.key,
    required this.fullText,
    required this.textStyle,
    this.speed = const Duration(milliseconds: 90),
    this.pause = const Duration(milliseconds: 900),
  });

  final String fullText;
  final TextStyle textStyle;
  final Duration speed;
  final Duration pause;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final measured = _measureTextWidth(fullText, textStyle, context);
        // Keep within available width (no overflow on narrow screens)
        final width = math.min(measured, constraints.maxWidth);

        return SizedBox(
          width: width,
          child: DefaultTextStyle(
            style: textStyle,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(fullText, speed: speed),
              ],
              repeatForever: true,
              pause: pause,
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
        );
      },
    );
  }

  double _measureTextWidth(String text, TextStyle style, BuildContext context) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: Directionality.of(context),
    )..layout();
    // small safety pad to avoid clipping the last glyph
    return tp.width + 2.0;
  }
}

Future<void> _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  }
}
