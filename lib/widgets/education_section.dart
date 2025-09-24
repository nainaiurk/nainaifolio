import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/education.dart';

class EducationSection extends StatelessWidget {
  final Key? key;
  EducationSection({this.key}) : super(key: key);

  // Sample data (you can extend this list)
  final List<Education> educationList = [
    Education(
      degree: 'BSC Engineering in Electrical and Electronic Engineering',
      institution: 'Shahjalal Univeristy of Science and Technology, Sylhet',
      duration: '2020 - 2024',
      description:
          'Focusd on Digital Electronics, Digital Signal Processing. VLSI, Embedded Systems, Robotics',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final isMobile = w < 600;
        final isTablet = w >= 600 && w < 1100;

        // Section paddings by breakpoint
        final horizPad = isMobile
            ? 16.0
            : isTablet
                ? 20.0
                : 24.0;
        final vertPad = isMobile
            ? 20.0
            : isTablet
                ? 26.0
                : 30.0;

    // Title sizing by breakpoint (reduced by 2px for mobile/tablet)
    final double titleFontSize = isMobile
      ? 18.0
      : isTablet
        ? 22.0
        : 28.0;
        final double titleIconSize = isMobile
            ? 20.0
            : isTablet
                ? 22.0
                : 24.0;
        final double titleGap = isMobile ? 10.0 : 14.0;

        // Card metrics by breakpoint
        final double cardRadius = isMobile ? 10.0 : 12.0;
        final double cardPad = isMobile
            ? 16.0
            : isTablet
                ? 20.0
                : 24.0;
        final double cardGap = isMobile
            ? 14.0
            : isTablet
                ? 16.0
                : 20.0;

        // Typography inside card
        final double degreeSize = isMobile
            ? 13.0
            : isTablet
                ? 18.0
                : 20.0;
        final double institutionSz = isMobile
            ? 11
            : isTablet
                ? 12.5
                : 15.0;
        final double durationSz = isMobile
            ? 11.0
            : isTablet
                ? 12.5
                : 13.0;
        final double bodySize = isMobile
            ? 11
            : isTablet
                ? 13.5
                : 15.0;

        // Slight nudge so title never hides under an AppBar on small screens
        final double titleTopPadding = w < 900 ? 12.0 : 0.0;

        return Container(
          width: double.infinity,
          padding:
              EdgeInsets.symmetric(vertical: vertPad, horizontal: horizPad),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: titleTopPadding, bottom: isMobile ? 16.0 : 24.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.book,
                      size: titleIconSize,
                      color: theme.colorScheme.primary,
                    ),
                    SizedBox(width: titleGap),
                    Flexible(
                      child: Text(
                        'Educational Qualifications',
                        style: theme.textTheme.headlineSmall?.copyWith(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.6,
                              color: theme.colorScheme.primary,
                            ) ??
                            TextStyle(
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.6,
                              color: theme.colorScheme.primary,
                            ),
                      ),
                    ),
                  ],
                ),
              ),

              // Cards
              ...educationList.map(
                (edu) => _EducationCard(
                  education: edu,
                  cardRadius: cardRadius,
                  cardPadding: cardPad,
                  degreeSize: degreeSize,
                  institutionSize: institutionSz,
                  durationSize: durationSz,
                  bodySize: bodySize,
                  marginBottom: cardGap,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _EducationCard extends StatelessWidget {
  const _EducationCard({
    required this.education,
    required this.cardRadius,
    required this.cardPadding,
    required this.degreeSize,
    required this.institutionSize,
    required this.durationSize,
    required this.bodySize,
    required this.marginBottom,
  });

  final Education education;
  final double cardRadius;
  final double cardPadding;
  final double degreeSize;
  final double institutionSize;
  final double durationSize;
  final double bodySize;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: marginBottom),
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.6)),
        boxShadow: isDark
            ? const []
            : [
                BoxShadow(
                  color: theme.colorScheme.secondary.withOpacity(0.5),
                  blurRadius: 14,
                  offset: const Offset(0, 8),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Degree
          Text(
            education.degree,
            style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: degreeSize,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ) ??
                TextStyle(
                  fontSize: degreeSize,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
          ),
          const SizedBox(height: 6),

          // Institution
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                education.institution,
                style: theme.textTheme.bodyMedium
                        ?.copyWith(fontSize: institutionSize) ??
                    TextStyle(fontSize: institutionSize),
              ),
              // const SizedBox(height: 6),

              // Duration
              Text(
                education.duration,
                style: theme.textTheme.bodySmall
                        ?.copyWith(fontSize: durationSize) ??
                    TextStyle(fontSize: durationSize),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Description
          Text(
            education.description,
            style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: bodySize,
                  height: 1.55,
                ) ??
                TextStyle(
                  fontSize: bodySize,
                  height: 1.55,
                ),
          ),
        ],
      ),
    );
  }
}
