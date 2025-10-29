import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/leadership_item.dart';
import '../utils/link_style.dart';
import '../utils/responsive.dart';

class LeadershipVolunteeringSection extends StatelessWidget {
  const LeadershipVolunteeringSection({super.key});

  static final List<LeadershipItem> _items = [
    LeadershipItem(
      title: 'President, RoboSUST – Volunteering Robotics Club of University',
      titleUrl:
          'https://drive.google.com/file/d/1gCTBNZSm8fb7HOHJ3zn9KoBJc8fmNhnI/view?usp=sharing',
      period: 'Mar 2023 – Jun 2025',
      highlights: const [
        [
          LinkSegment(
            'Led 60+ members of the Robotics Club. Organized 3 national-level workshops and 2 outreach programs, training 100+ students in robotics and IoT with hands-on embedded systems experience. Mentored 2 teams to win the Robotic Contest.',
          ),
        ],
      ],
    ),
    LeadershipItem(
      title: 'Robotics & PCB Design Trainer',
      titleUrl: 'https://www.facebook.com/share/19ue2ncwcx/?mibextid=wwXIfr',
      period: 'Apr 2023 – Sep 2024',
      highlights: const [
        [
          LinkSegment('As a '),
          LinkSegment(
            'certified EasyEDA trainer',
            url:
                'https://drive.google.com/file/d/1VffpiWSmewAvIgWV2Vii274kquTGDGDL/view?usp=sharing',
          ),
          LinkSegment(
              ', trained 200+ students in advanced PCB design through a 3-day national '),
          LinkSegment(
            'workshop',
            url:
                'https://youtube.com/playlist?list=PLszIg03w3cSG3MHYaAfgLtNWrg5taIW_L&si=x4yfTXhPi1-dQG3a',
          ),
          LinkSegment(' series in collaboration with EasyEDA.'),
        ],
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context, mobileBreakpoint: 700);
    final isTablet = Responsive.isTablet(context);
    final titleFont = isMobile ? 18.0 : (isTablet ? 20.0 : 28.0);
    final bodyFont = isMobile ? 11.5 : (isTablet ? 13.0 : 14.5);
    final bulletGap = isMobile ? 8.0 : 10.0;

    return Container(
      width: double.infinity,
      color: theme.colorScheme.background,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 24.0 : 32.0,
        horizontal: isMobile ? 16.0 : 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.volunteer_activism,
                size: isMobile ? 20 : (isTablet ? 22 : 24),
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Text(
                'Leadership & Volunteering Experience',
                style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: titleFont,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                      color: theme.colorScheme.primary,
                    ) ??
                    TextStyle(
                      fontSize: titleFont,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                      color: theme.colorScheme.primary,
                    ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 16 : 24),
          ..._items.map((item) => _LeadershipCard(
                item: item,
                bodyFont: bodyFont,
                bulletGap: bulletGap,
                isMobile: isMobile,
              )),
        ],
      ),
    );
  }
}

class _LeadershipCard extends StatelessWidget {
  const _LeadershipCard({
    required this.item,
    required this.bodyFont,
    required this.bulletGap,
    required this.isMobile,
  });

  final LeadershipItem item;
  final double bodyFont;
  final double bulletGap;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: isMobile ? 16.0 : 20.0),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 14.0 : 18.0,
        vertical: isMobile ? 12.0 : 16.0,
      ),
      decoration: BoxDecoration(
        color: isDark ? theme.cardColor : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(isMobile ? 10.0 : 14.0),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.6)),
        boxShadow: isDark
            ? const []
            : [
                BoxShadow(
                  color: theme.colorScheme.secondary.withOpacity(0.24),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _TitleLink(
                  text: item.title,
                  url: item.titleUrl,
                  fontSize: isMobile ? 13.5 : 16.0,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                item.period,
                style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: isMobile ? 11.0 : 12.5,
                      color:
                          theme.textTheme.bodySmall?.color?.withOpacity(0.75),
                    ) ??
                    TextStyle(
                      fontSize: isMobile ? 11.0 : 12.5,
                      color:
                          theme.textTheme.bodySmall?.color?.withOpacity(0.75),
                    ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          SizedBox(height: bulletGap),
          ...item.highlights.map(
            (segments) => Padding(
              padding: EdgeInsets.only(bottom: bulletGap),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: bodyFont,
                              height: 1.55,
                              color: theme.textTheme.bodyMedium?.color,
                            ) ??
                            TextStyle(
                              fontSize: bodyFont,
                              height: 1.55,
                              color: theme.textTheme.bodyMedium?.color,
                            ),
                        children: segments
                            .map(
                              (segment) => TextSpan(
                                text: segment.text,
                                style: segment.url == null
                                    ? null
                                    : linkTextStyle(context,
                                        fontSize: bodyFont,
                                        fontWeight: FontWeight.w600),
                                recognizer: segment.url == null
                                    ? null
                                    : (TapGestureRecognizer()
                                      ..onTap = () async {
                                        final uri = Uri.parse(segment.url!);
                                        if (await canLaunchUrl(uri)) {
                                          await launchUrl(uri,
                                              mode: LaunchMode
                                                  .externalApplication);
                                        }
                                      }),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleLink extends StatelessWidget {
  const _TitleLink(
      {required this.text, required this.url, required this.fontSize});

  final String text;
  final String? url;
  final double fontSize;

  Future<void> _launch(String link) async {
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseStyle = theme.textTheme.titleMedium?.copyWith(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: theme.colorScheme.primary,
        ) ??
        TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: theme.colorScheme.primary,
        );

    if (url == null || url!.isEmpty) {
      return Text(text, style: baseStyle);
    }

    return GestureDetector(
      onTap: () => _launch(url!),
      child: Text(
        text,
        style: baseStyle.merge(
          const TextStyle(decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
