import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/award_item.dart';
import '../models/leadership_item.dart';
import '../utils/link_style.dart';
import '../utils/responsive.dart';

class AwardsCertificationsSection extends StatelessWidget {
  const AwardsCertificationsSection({super.key});

  static final List<AwardItem> _items = [
    const AwardItem(
      title: 'Competition & Hackathon Distinctions',
      issuer: 'International & National Engineering Events',
      date: '2023 – 2024',
      highlights: const [
        [
          const LinkSegment('Winner',
              url:
                  'https://drive.google.com/file/d/1VQQ0TsFdYC3RF_0D8B1G0jAn9il1F5Vq/view?usp=sharing'),
          const LinkSegment(
              ' (Team Lead), JRC Board Hackathon (IoT in Industry) — delivered an IoT-enabled energy monitoring system in 24 hours (2023).'),
        ],
        [
          const LinkSegment('2nd Runner-Up',
              url:
                  'https://drive.google.com/file/d/1BaESfaLckYSf56R7Tm9bQM6ds1uCZ-cl/view?usp=sharing'),
          const LinkSegment(
              ' (Team Lead), Line Follower Robot Contest (2023).'),
        ],
        [
          const LinkSegment('International Contest- ',
              url:
                  'https://drive.google.com/file/d/1VffpiWSmewAvIgWV2Vii274kquTGDGDL/view?usp=sharing'),
          const LinkSegment(
              ', represented Bangladesh among 25+ countries and 50+ teams in the Singapore AUV Challenge.'),
        ],
        [
          const LinkSegment('Secured seed funding-.',
              url:
                  'https://drive.google.com/file/d/1VDerRfKn2Lv_-EjJHWTQApeAVrFQueO4/view?usp=sharing'),
          const LinkSegment(
              'to launch an AUV startup through the University Innovation Hub, focusing on autonomous marine robotics commercialization.'),
        ],
      ],
      tags: const ['Hackathons', 'Robotics', 'Team Leadership'],
    ),
    const AwardItem(
      title: 'Specialized Training Certifications',
      issuer: 'TICI · Ulkasemi · Coursera',
      date: '2022 – 2024',
      highlights: const [
        [
          const LinkSegment('TICI Certification: ',
              url:
                  'https://drive.google.com/file/d/1pem2_XwcNrlcdcxXVAJyJXv9a6wMokXP/view?usp=sharing'),
          const LinkSegment(
              '21 days training in Electrical Equipment, Power Systems, and PLC — evaluated with an A+ grade.'),
        ],
        [
          const LinkSegment('Ulkasemi Certification:',
              url:
                  'https://drive.google.com/file/d/13BA9-XdVSMdbl22rjmcJl898YokNoTim/view?usp=sharing'),
          const LinkSegment(
              '7 days training focused on analog design and IC mask layout best practices.'),
        ],
        [
          const LinkSegment('Coursera —',
              url:
                  'https://drive.google.com/file/d/1FlPI5nLz1TGsV6VDjtCB_-xHmlOVqa3b/view?usp=sharing'),
          const LinkSegment(
              'Embedded Machine Learning: Built embedded ML workflows with Edge Impulse and neural networks for microcontrollers.'),
        ],
      ],
      tags: const [
        'Industrial Automation',
        'Analog Design',
        'Machine Learning'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);

    final titleSize = isMobile ? 18.0 : (isTablet ? 21.0 : 28.0);
    final cardTitleSize = isMobile ? 14.0 : (isTablet ? 16.0 : 18.0);
    final bodySize = isMobile ? 11.0 : (isTablet ? 12.5 : 13.5);
    final chipFont = isMobile ? 10.0 : 11.5;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary.withOpacity(0.08),
            theme.colorScheme.secondary.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 28.0 : 36.0,
        horizontal: isMobile ? 16.0 : 24.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.award,
                size: isMobile ? 18 : (isTablet ? 20 : 24),
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Text(
                'Awards & Certifications',
                style: theme.textTheme.headlineSmall?.copyWith(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                      color: theme.colorScheme.primary,
                    ) ??
                    TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.6,
                      color: theme.colorScheme.primary,
                    ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 10 : 14),
          Text(
            'Recognition for technical excellence, trusted instruction, and community impact across robotics and embedded systems.',
            style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: isMobile ? 11.5 : (isTablet ? 12.5 : 14),
                  height: 1.55,
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
                ) ??
                TextStyle(
                  fontSize: isMobile ? 11.5 : (isTablet ? 12.5 : 14),
                  height: 1.55,
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
                ),
          ),
          SizedBox(height: isMobile ? 18 : 24),
          ..._items.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final item = entry.value;
              final isLast = index == _items.length - 1;

              return Padding(
                padding:
                    EdgeInsets.only(bottom: isLast ? 0 : (isMobile ? 18 : 22)),
                child: _AwardTimelineCard(
                  item: item,
                  cardTitleSize: cardTitleSize,
                  bodySize: bodySize,
                  chipFont: chipFont,
                  isMobile: isMobile,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AwardTimelineCard extends StatelessWidget {
  const _AwardTimelineCard({
    required this.item,
    required this.cardTitleSize,
    required this.bodySize,
    required this.chipFont,
    required this.isMobile,
  });

  final AwardItem item;
  final double cardTitleSize;
  final double bodySize;
  final double chipFont;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return RepaintBoundary(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 20,
          vertical: isMobile ? 14 : 18,
        ),
        decoration: BoxDecoration(
          color: isDark
              ? theme.colorScheme.surfaceVariant.withOpacity(0.35)
              : Colors.white.withOpacity(0.78),
          borderRadius: BorderRadius.circular(isMobile ? 14 : 18),
          border: Border.all(
            color: theme.colorScheme.primary.withOpacity(0.35),
          ),
          boxShadow: isDark
              ? const []
              : [
                  BoxShadow(
                    color: theme.colorScheme.secondary.withOpacity(0.18),
                    blurRadius: 16,
                    offset: const Offset(0, 12),
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
                  child: Text(
                    item.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: cardTitleSize,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                          color: theme.colorScheme.primary,
                        ) ??
                        TextStyle(
                          fontSize: cardTitleSize,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                          color: theme.colorScheme.primary,
                        ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  item.date,
                  style: theme.textTheme.bodySmall?.copyWith(
                        fontSize: isMobile ? 11.0 : 12.0,
                        color:
                            theme.textTheme.bodySmall?.color?.withOpacity(0.75),
                      ) ??
                      TextStyle(
                        fontSize: isMobile ? 11.0 : 12.0,
                        color:
                            theme.textTheme.bodySmall?.color?.withOpacity(0.75),
                      ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            SizedBox(height: isMobile ? 6 : 8),
            Text(
              item.issuer,
              style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: isMobile ? 11.5 : 12.5,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.w600,
                  ) ??
                  TextStyle(
                    fontSize: isMobile ? 11.5 : 12.5,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            if (item.tags.isNotEmpty) ...[
              SizedBox(height: isMobile ? 10 : 12),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                children: item.tags
                    .map(
                      (tag) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: isMobile ? 4 : 6,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(
                            color: theme.colorScheme.primary.withOpacity(0.32),
                          ),
                        ),
                        child: Text(
                          tag,
                          style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: chipFont,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3,
                                color: theme.colorScheme.primary,
                              ) ??
                              TextStyle(
                                fontSize: chipFont,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3,
                                color: theme.colorScheme.primary,
                              ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
            if (item.highlights.isNotEmpty) ...[
              SizedBox(height: isMobile ? 10 : 12),
              ...item.highlights.asMap().entries.map(
                (entry) {
                  final segments = entry.value;
                  final isLastHighlight =
                      entry.key == item.highlights.length - 1;
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: isLastHighlight ? 0 : (isMobile ? 8 : 10),
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: bodySize,
                              height: 1.6,
                              color: theme.textTheme.bodyMedium?.color,
                            ) ??
                            TextStyle(
                              fontSize: bodySize,
                              height: 1.6,
                              color: theme.textTheme.bodyMedium?.color,
                            ),
                        children: segments
                            .map(
                              (segment) => TextSpan(
                                text: segment.text,
                                style: segment.url == null
                                    ? null
                                    : linkTextStyle(
                                        context,
                                        fontSize: bodySize,
                                        fontWeight: FontWeight.w600,
                                      ),
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
                  );
                },
              ),
            ],
            if (item.credentialUrl != null &&
                item.credentialUrl!.trim().isNotEmpty) ...[
              SizedBox(height: isMobile ? 12 : 14),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () async {
                    final uri = Uri.parse(item.credentialUrl!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: isMobile ? 6 : 8,
                    ),
                  ),
                  icon: Icon(
                    Icons.open_in_new_rounded,
                    size: isMobile ? 16 : 18,
                    color: theme.colorScheme.primary,
                  ),
                  label: Text(
                    'View credential',
                    style: linkTextStyle(
                      context,
                      fontSize: isMobile ? 11.5 : 12.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
