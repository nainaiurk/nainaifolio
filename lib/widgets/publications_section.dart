import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/publication_item.dart';

class PublicationsSection extends StatelessWidget {
  const PublicationsSection({super.key});

  static const List<PublicationItem> _publications = [
    PublicationItem(
      title:
          'MLPNN and Ensemble Learning Algorithm for Transmission Line Fault Classification',
      year: 2024,
      venue:
          'International Transactions on Electrical Energy Systems (Q2 Journal, Wiley)',
      link: 'https://onlinelibrary.wiley.com/doi/10.1155/etep/6114718',
      summary:
          'Benchmarked multilayer perceptron and ensemble models for utility-scale transmission line fault diagnosis, enabling faster protection schemes for high-voltage networks.',
    ),
    PublicationItem(
      title:
          'A Comprehensive Android App-Based Solution for Automated Attendance and Management in Institutions Using IoT and TinyML.',
      year: 2023,
      venue:
          'ICICT4SD 2023 – Intl. Conference on ICT for Sustainable Development',
      link: 'https://ieeexplore.ieee.org/document/10303506',
      summary:
          'Delivered an end-to-end ESP32-CAM and TinyML attendance pipeline with Flutter-based management tooling for secure, low-cost academic deployments.',
    ),
    PublicationItem(
      title:
          'A Comparative Analysis of Power Consumption and Security Features in LoRa and LoRaWAN Messaging Devices',
      year: 2024,
      venue:
          'ICAEEE 2024 – Intl. Conference on Advances in Electrical & Electronic Engineering',
      link: 'https://ieeexplore.ieee.org/document/10561782',
      summary:
          'Profiled the energy and cryptographic trade-offs of long-range IoT messaging platforms, guiding protocol selection for resilient field deployments.',
    ),
    PublicationItem(
      title:
          'IoT-Driven Smart Workplace Ecosystem with RFID Security and Environmental Monitoring',
      year: 2024,
      venue: 'PEEIACON 2024 – IEEE Power, Energy and Innovations Conference',
      link: 'https://ieeexplore.ieee.org/document/10800453',
      summary:
          'Architected a secure workplace IoT layer combining RFID access, environmental telemetry, and real-time analytics for industrial-grade monitoring.',
    ),
    PublicationItem(
      title:
          'Revolution in Campus Transportation: The Autonomous Electric Vehicle With Smart Features',
      year: 2023,
      venue: 'ICPS 2023 – IEEE Intl. Conference on Electrical & Power Systems',
      link: 'https://ieeexplore.ieee.org/document/10429029',
      summary:
          'Engineered embedded control and perception subsystems for Bangladesh’s first Level 2 autonomous campus vehicle, advancing smart mobility research.',
    ),
    PublicationItem(
      title:
          'Development of a Portable Dual-Verification Biometric Attendance System for Real-Time Monitoring',
      year: 2024,
      venue:
          'Springer – International Conference on Machine Intelligence and Emerging Technologies',
      link: 'https://link.springer.com/chapter/10.1007/978-981-96-2721-9_41',
      summary:
          'Implemented fingerprint and facial biometric fusion on an embedded edge device to deliver reliable, privacy-aware attendance tracking.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final isMobile = w < 700;
    final isTablet = w >= 700 && w < 1100;

    double rem(double v) {
      final base = (w < h ? w : h) * 0.01;
      final clamped = base.clamp(8.0, 18.0);
      return clamped * v;
    }

    // heading titleFont already applied via headingStyle; no separate var needed
    // Align sizes with ExperienceSection
    final titleFont = isMobile ? 20.0 : (isTablet ? 22.0 : 28.0);
    final pubTitleFont = isMobile ? 12.0 : (isTablet ? 14.0 : 16.0);
    final venueFont = isMobile ? 11.0 : (isTablet ? 12.5 : 13.5);
    final summaryFont = isMobile ? 10.0 : (isTablet ? 12.0 : 13.0);
    final sectionV = rem(3.5);
    final sectionH = isMobile ? 16.0 : 24.0;
    final cardPad = isMobile ? 8.0 : 12.0;
    final cardRadius = isMobile ? 10.0 : 14.0;
    final cardGap = isMobile ? 12.0 : 16.0;

    final headingStyle = theme.textTheme.headlineSmall?.copyWith(
      fontSize: titleFont,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.6,
      color: theme.colorScheme.primary,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: sectionV, horizontal: sectionH),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.fileLines,
                size: isMobile ? 18 : (isTablet ? 20 : 22),
                color: theme.colorScheme.primary,
              ),
              SizedBox(width: rem(0.8)),
              Text(
                'Peer-Reviewed Publications',
                style: headingStyle,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(height: isMobile ? 8 : 12),

          // Publication counts line (journals vs conferences)
          Builder(builder: (ctx) {
            // Per user's instruction: the first publication in the list is the only journal
            final journals = _publications.isNotEmpty ? 1 : 0;
            final conferences = _publications.length - journals;
            final counts = '${journals} Journals · ${conferences} Conferences';
            return Text(
              counts,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: isMobile ? 11.0 : (isTablet ? 12.0 : 13.0),
                color: theme.textTheme.bodySmall?.color?.withOpacity(0.8),
              ),
            );
          }),

          SizedBox(height: isMobile ? 8 : 12),

          ..._publications.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: cardGap),
              child: _PublicationCard(
                item: item,
                pubTitleFont: pubTitleFont,
                venueFont: venueFont,
                summaryFont: summaryFont,
                isMobile: isMobile,
                isTablet: isTablet,
                cardPad: cardPad,
                cardRadius: cardRadius,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PublicationCard extends StatelessWidget {
  const _PublicationCard({
    required this.item,
    required this.pubTitleFont,
    required this.venueFont,
    required this.summaryFont,
    required this.isMobile,
    required this.isTablet,
    required this.cardPad,
    required this.cardRadius,
  });

  final PublicationItem item;
  final double pubTitleFont;
  final double venueFont;
  final double summaryFont;
  final bool isMobile;
  final bool isTablet;
  final double cardPad;
  final double cardRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final background =
        isDark ? theme.cardColor : theme.colorScheme.surface.withOpacity(0.96);

    final double pad = cardPad;
    final double radius = cardRadius;

    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(pad),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: theme.colorScheme.secondary.withOpacity(0.4),
          ),
          boxShadow: isDark
              ? const []
              : [
                  BoxShadow(
                    color: theme.colorScheme.secondary.withOpacity(0.5),
                    blurRadius: 18,
                    offset: const Offset(0, 12),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: pubTitleFont,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                    color: theme.colorScheme.primary,
                  ) ??
                  TextStyle(
                    fontSize: pubTitleFont,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                    color: theme.colorScheme.primary,
                  ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: isMobile ? 10 : 12),
            Text(
              '${item.venue} – ${item.year}',
              style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: venueFont,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.85),
                  ) ??
                  TextStyle(
                    fontSize: venueFont,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.85),
                  ),
              textAlign: TextAlign.start,
            ),
            // SizedBox(height: isMobile ? 6 : 10),
            Text(
              item.summary,
              style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: summaryFont,
                    height: 1.6,
                    color: theme.textTheme.bodyMedium?.color,
                  ) ??
                  TextStyle(
                    fontSize: summaryFont,
                    height: 1.6,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
              textAlign: TextAlign.start,
            ),
            // SizedBox(height: isMobile ? 8 : 16),
            TextButton.icon(
                onPressed: () => _launchLink(item.link),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: theme.primaryColor,
                ),
                icon: FaIcon(
                  FontAwesomeIcons.arrowUpRightFromSquare,
                  size: isMobile ? 10 : 14,
                ),
                label: Text(
                  'View publication',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: isMobile ? 11.0 : (isTablet ? 12.0 : 14.0),
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                )),
          ],
        ));
  }
}

Future<void> _launchLink(String link) async {
  final uri = Uri.parse(link);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    debugPrint('Could not launch $link');
  }
}
