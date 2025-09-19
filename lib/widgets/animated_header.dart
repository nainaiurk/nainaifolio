import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:js' as js;
import '../utils/responsive.dart';
import 'cv_viewer_page.dart';

class AnimatedHeader extends StatelessWidget {
  const AnimatedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: _getHeaderHeight(context), // Set constant height for the header
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: _getImageTopPosition(context),
            left: 0,
            child: Image(
              image: const AssetImage('assets/images/me.png'),
              fit: BoxFit.contain,
              height: _getHeaderHeight(context),
              width: _getImageWidth(context),
            ),
          ),
          Positioned(
            top: _getTextTopPosition(context),
            right: 0,
            child: Container(
              color: Colors.transparent,
              width: _getTextContainerWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // CV Button positioned prominently above Hello
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 5), // Reduced from 10 to 5
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CVViewerPage()),
                        );
                      },
                      icon: const Icon(Icons.description, size: 20),
                      label: const Text(
                        'View My CV',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2,
                        ),
                        foregroundColor: Theme.of(context).colorScheme.primary,
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.05),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Hello:)",
                        style: TextStyle(
                          fontSize: _getTitleFontSize(context),
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        'assets/gif/hand_wave.gif', // Replace with your GIF path
                        height: _getGifSize(context),
                      ),
                    ],
                  ),
                  SizedBox(height: _getTitleSpace(context)),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Welcome to Nainai's Portfolio",
                        textStyle: TextStyle(
                          fontSize: _getSubtitleFontSize(context),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                    pause: const Duration(milliseconds: 1000),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                  SizedBox(height: _getSubtitleSpace(context)),
                  Text(
                    "NAINAIU",
                    style: GoogleFonts.montserrat(
                      fontSize: _getNameFontSize(context),
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "RAKHAINE",
                    style: GoogleFonts.montserrat(
                      fontSize: _getNameFontSize(context),
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: _getIconSpace(context)),
                  if (!Responsive.isMobile(context))
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            _launchURL(
                                'https://www.facebook.com/nainaiu.rk1234/');
                          },
                          icon: const Icon(FontAwesomeIcons.facebook),
                          color: Theme.of(context).colorScheme.primary,
                          iconSize: _getIconSize(context),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchURL(
                                'https://www.linkedin.com/in/nainaiu-rakhaine');
                          },
                          icon: const Icon(FontAwesomeIcons.linkedin),
                          color: Theme.of(context).primaryColor,
                          iconSize: _getIconSize(context),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchURL(
                                'https://www.linkedin.com/in/nainaiu-rakhaine');
                          },
                          icon: const Icon(FontAwesomeIcons.twitter),
                          color: Theme.of(context).primaryColor,
                          iconSize: _getIconSize(context),
                        ),
                        IconButton(
                          onPressed: () {
                            _launchURL('https://github.com/nainaiurk');
                          },
                          icon: const Icon(FontAwesomeIcons.github),
                          color: Theme.of(context).primaryColor,
                          iconSize: _getIconSize(context),
                        ),
                      ],
                    ),
                  if (Responsive.isMobile(context))
                    Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                _launchURL(
                                    'https://www.facebook.com/nainaiu.rk1234/');
                              },
                              icon: const Icon(FontAwesomeIcons.facebook),
                              color: Theme.of(context).primaryColor,
                              iconSize: _getIconSize(context),
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              onPressed: () {
                                _launchURL(
                                    'https://www.linkedin.com/in/nainaiu-rakhaine');
                              },
                              icon: const Icon(FontAwesomeIcons.linkedin),
                              color: Theme.of(context).primaryColor,
                              iconSize: _getIconSize(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            IconButton(
                              onPressed: () {
                                _launchURL(
                                    'https://www.linkedin.com/in/nainaiu-rakhaine');
                              },
                              icon: const Icon(FontAwesomeIcons.twitter),
                              color: Theme.of(context).primaryColor,
                              iconSize: _getIconSize(context),
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              onPressed: () {
                                _launchURL('https://github.com/nainaiurk');
                              },
                              icon: const Icon(FontAwesomeIcons.github),
                              color: Theme.of(context).primaryColor,
                              iconSize: _getIconSize(context),
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) {
    js.context.callMethod('open', [url]);
  }

  // Define constant heights for different screen types
  double _getHeaderHeight(BuildContext context) {
    if (Responsive.isDesktop(context)) return 800.0; // Full height for laptops
    if (Responsive.isTablet(context)) return 600.0; // Half height for tablets
    return 300.0; // Half height for mobile
  }

  // Image Positioning and Sizing
  double _getImageTopPosition(BuildContext context) {
    if (Responsive.isMobile(context)) return 20.0;
    if (Responsive.isTablet(context)) return 50.0;
    return 100.0; // Desktop
  }

  double _getImageWidth(BuildContext context) {
    if (Responsive.isMobile(context)) return getMaxWidth(context) * 0.45;
    if (Responsive.isTablet(context)) return getMaxWidth(context) * 0.45;
    return 600.0; // Desktop
  }

  // Text Positioning and Sizing
  double _getTextTopPosition(BuildContext context) {
    if (Responsive.isMobile(context)) return 40.0; // Moved up from 80.0
    if (Responsive.isTablet(context)) return 80.0; // Moved up from 140.0
    return 250.0; // Moved up from 300.0 for Desktop
  }

  double _getTitleSpace(BuildContext context) {
    if (Responsive.isMobile(context)) return 5.0;
    if (Responsive.isTablet(context)) return 20.0;
    return 20.0; // Desktop
  }

  double _getSubtitleSpace(BuildContext context) {
    if (Responsive.isMobile(context)) return 20.0;
    if (Responsive.isTablet(context)) return 60.0;
    return 60.0; // Desktop
  }

  double _getIconSpace(BuildContext context) {
    if (Responsive.isMobile(context)) return 0.0;
    if (Responsive.isTablet(context)) return 60.0;
    return 60.0; // Desktop
  }

  double _getTextContainerWidth(BuildContext context) {
    if (Responsive.isMobile(context)) return getMaxWidth(context) * 0.37;
    if (Responsive.isTablet(context)) return getMaxWidth(context) * 0.42;
    return 500.0; // Desktop
  }

  double _getTitleFontSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 12;
    if (Responsive.isTablet(context)) return 22;
    return 25; // Desktop
  }

  double _getSubtitleFontSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 10;
    if (Responsive.isTablet(context)) return 22;
    return 25; // Desktop
  }

  double _getNameFontSize(BuildContext context) {
    if (Responsive.isMobile(context)) return getMaxWidth(context) * 0.06;
    if (Responsive.isTablet(context)) return 45;
    return 50; // Desktop
  }

  double _getIconSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 20;
    if (Responsive.isTablet(context)) return 40;
    return 50; // Desktop
  }

  double _getGifSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 20;
    if (Responsive.isTablet(context)) return 30;
    return 40; // Desktop
  }

  // Utility Methods
  double getMaxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double getMaxWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
