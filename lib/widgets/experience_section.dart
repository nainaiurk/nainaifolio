import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

import '../models/experience_item.dart';
import '../utils/responsive.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static final List<ExperienceItem> _experiences = [
    const ExperienceItem(
      role: 'Research Assistant',
      organization: 'Autonomous Vehicle Research Group, SUST',
      period: 'Jul 2024 - 2025',
      location: 'Sylhet, Bangladesh',
      summary:
          'Collaborating with Prof. Dr. Mohammad Shahidur Rahman on AutoMAMA, Bangladesh\'s first Level 2 autonomous vehicle initiative.',
      highlights: [
        'Delivered sensor-integration and control modules that enabled reliable two-passenger autonomous operation.',
        'Coordinated embedded software validation across perception, actuation, and safety subsystems to meet research milestones.',
      ],
      professorLink:
          'https://www.sust.edu/departments/cse/faculty/rahmanms@sust.edu',
    ),
    const ExperienceItem(
      role: 'Research Assistant',
      organization: 'Embedded Systems Lab, SUST',
      period: 'Jul 2023 - Present',
      location: 'Sylhet, Bangladesh',
      summary:
          'Working with Assoc. Prof. Dr. Md Rashedujjaman on resilient IoT platforms and lab instrumentation for academic deployments.',
      highlights: [
        'Engineered a custom ESP32-S3 data logger adopted across ongoing research projects and student training cohorts.',
        'Integrated low-power MQTT communication into an IoT-enabled P10 notice board to streamline campus messaging.',
      ],
      professorLink:
          'https://www.sust.edu/departments/eee/faculty/mrased-eee@sust.edu',
    ),
    const ExperienceItem(
      role: 'Research Assistant',
      organization: 'Sustainable Energy & IoT Group, SUST',
      period: 'Jun 2022 - Present',
      location: 'Sylhet, Bangladesh',
      summary:
          'Supporting Asst. Prof. Arif Ahammad on intelligent sensing systems for campus-scale deployments.',
      highlights: [
        'Built a multimodal biometric attendance platform (face + fingerprint) deployed at university events for secure access control.',
        'Developed a hybrid solar-wind IoT monitoring node with efficient telemetry for off-grid environmental sensing.',
      ],
      professorLink: 'https://github.com/nainaiurk/LoRa-Messenger',
    ),
    const ExperienceItem(
      role: 'Electronic Content Engineer',
      organization: 'JLCPCB',
      period: '2024 - Present',
      location: 'Remote',
      summary:
          'Produce industry-grade PCB design and embedded tutorials consumed by a global maker and academic community.',
      highlights: [
        'Author detailed design guides spanning advanced PCB layout, embedded firmware, and TinyML workflows.',
        'Collaborate with product teams to validate reference designs prior to publication for engineering audiences.',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headingStyle = theme.textTheme.headlineSmall?.copyWith(
      fontSize: TitleFontSize().titleFontSize(context),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                FontAwesomeIcons.briefcase,
                size: 24,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  'Research and Professional Experience',
                  style: headingStyle,
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Hands-on roles spanning autonomous systems, IoT instrumentation, and technical communication for next-generation embedded platforms.',
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 32),
          ..._experiences.map((item) => _ExperienceCard(item: item)),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({required this.item});

  final ExperienceItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final background =
        isDark ? theme.cardColor : theme.colorScheme.surface.withOpacity(0.98);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.4),
        ),
        boxShadow: isDark
            ? const []
            : [
                BoxShadow(
                  color: theme.colorScheme.primary.withOpacity(0.08),
                  blurRadius: 18,
                  offset: const Offset(0, 12),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.role,
            style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.4,
                  color: theme.colorScheme.primary,
                ) ??
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            '${item.organization} | ${item.location}',
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
              color: theme.textTheme.bodySmall?.color?.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.period,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 12),
          _buildSummaryWithLinks(item.summary, item.professorLink, context),
          const SizedBox(height: 16),
          ...item.highlights.map(
            (highlight) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
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
                    child: Text(
                      highlight,
                      style: theme.textTheme.bodyMedium?.copyWith(
                            height: 1.6,
                            color: theme.textTheme.bodyMedium?.color,
                          ) ??
                          TextStyle(
                            fontSize: 15,
                            height: 1.6,
                            color: theme.textTheme.bodyMedium?.color,
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

  Widget _buildSummaryWithLinks(
      String summary, String? professorLink, BuildContext context) {
    final theme = Theme.of(context);

    if (professorLink == null || professorLink.isEmpty) {
      // If no professor link, just return regular text
      return Text(
        summary,
        style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: theme.textTheme.bodyMedium?.color,
            ) ??
            TextStyle(
              fontSize: 15,
              height: 1.6,
              color: theme.textTheme.bodyMedium?.color,
            ),
      );
    }

    // Extract professor name from summary (assuming it follows "with" or "Working with")
    final professorPatterns = [
      RegExp(r'with\s+([^,]+)', caseSensitive: false),
      RegExp(r'Working with\s+([^,]+)', caseSensitive: false),
      RegExp(r'Supporting\s+([^,]+)', caseSensitive: false),
      RegExp(r'Collaborating with\s+([^,]+)', caseSensitive: false),
    ];

    String? professorName;
    for (final pattern in professorPatterns) {
      final match = pattern.firstMatch(summary);
      if (match != null && match.groupCount >= 1) {
        professorName = match.group(1)?.trim();
        break;
      }
    }

    if (professorName == null) {
      // If we can't extract professor name, return regular text
      return Text(
        summary,
        style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: theme.textTheme.bodyMedium?.color,
            ) ??
            TextStyle(
              fontSize: 15,
              height: 1.6,
              color: theme.textTheme.bodyMedium?.color,
            ),
      );
    }

    // Split the text around the professor name
    final parts = summary.split(professorName);
    if (parts.length != 2) {
      // If we can't split properly, return regular text
      return Text(
        summary,
        style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: theme.textTheme.bodyMedium?.color,
            ) ??
            TextStyle(
              fontSize: 15,
              height: 1.6,
              color: theme.textTheme.bodyMedium?.color,
            ),
      );
    }

    return RichText(
      text: TextSpan(
        style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: theme.textTheme.bodyMedium?.color,
            ) ??
            TextStyle(
              fontSize: 15,
              height: 1.6,
              color: theme.textTheme.bodyMedium?.color,
            ),
        children: [
          TextSpan(text: parts[0]),
          TextSpan(
            text: professorName,
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                final Uri uri = Uri.parse(professorLink);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              },
          ),
          TextSpan(text: parts[1]),
        ],
      ),
    );
  }
}
