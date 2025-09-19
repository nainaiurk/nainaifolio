import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/publication_item.dart';

class PublicationsSection extends StatelessWidget {
  const PublicationsSection({super.key});

  static const double _titleFontSize = 28;

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
    final headingStyle = theme.textTheme.headlineSmall?.copyWith(
      fontSize: _titleFontSize,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.6,
      color: theme.colorScheme.primary,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Peer-Reviewed Publications',
            style: headingStyle,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          Text(
            'Selected journal and IEEE conference publications demonstrating embedded intelligence, edge analytics, and autonomous system design.',
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 32),
          ..._publications.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _PublicationCard(item: item),
            ),
          ),
        ],
      ),
    );
  }
}

class _PublicationCard extends StatelessWidget {
  const _PublicationCard({required this.item});

  final PublicationItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final background =
        isDark ? theme.cardColor : theme.colorScheme.surface.withOpacity(0.96);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: theme.colorScheme.secondary.withOpacity(0.25),
        ),
        boxShadow: isDark
            ? const []
            : [
                BoxShadow(
                  color: theme.colorScheme.secondary.withOpacity(0.08),
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
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  color: theme.colorScheme.primary,
                ) ??
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  color: theme.colorScheme.primary,
                ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 12),
          Text(
            '${item.venue} – ${item.year}',
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
              color: theme.textTheme.bodySmall?.color?.withOpacity(0.85),
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 12),
          Text(
            item.summary,
            style: theme.textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                  color: theme.textTheme.bodyMedium?.color,
                ) ??
                TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: theme.textTheme.bodyMedium?.color,
                ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          TextButton.icon(
            onPressed: () => _launchLink(item.link),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              foregroundColor: theme.primaryColor,
            ),
            icon: const FaIcon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              size: 14,
            ),
            label: const Text('View publication'),
          ),
        ],
      ),
    );
  }
}

Future<void> _launchLink(String link) async {
  final uri = Uri.parse(link);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    debugPrint('Could not launch $link');
  }
}
