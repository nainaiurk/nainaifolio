import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/experience_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  static final List<ExperienceItem> _experiences = [
    const ExperienceItem(
      role: 'Research Assistant',
      organization: 'Autonomous Vehicle Research Group, SUST',
      period: 'Jul 2024 - 2025',
      location: 'Sylhet, Bangladesh',
      summary: '',
      supervisor: 'Prof. Dr. Mohammad Shahidur Rahman',
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
      summary: '',
      supervisor: 'Assoc. Prof. Dr. Md Rashedujjaman',
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
      summary: '',
      supervisor: 'Asst. Prof. Arif Ahammad',
      highlights: [
        'Built a multimodal biometric attendance platform (face + fingerprint) deployed at university events for secure access control.',
        'Developed a hybrid solar-wind IoT monitoring node with efficient telemetry for off-grid environmental sensing.',
      ],
      professorLink: 'https://github.com/nainaiurk/LoRa-Messenger',
    ),
    const ExperienceItem(
      role: 'Electronic Content Engineer',
      organization: 'JLCPCB',
      period: '2025 June - Present',
      location: 'Remote',
      summary: '',
      supervisor: null,
      highlights: [
        'Author detailed design guides spanning advanced PCB layout, embedded firmware, and TinyML workflows.',
        'Collaborate with product teams to validate reference designs prior to publication for engineering audiences.',
      ],
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

    final titleFont = isMobile ? 20.0 : (isTablet ? 22.0 : 28.0);
    final roleSize = isMobile ? 14.0 : (isTablet ? 16.0 : 18.0);
    final orgLocSize = isMobile ? 12.0 : (isTablet ? 13.5 : 14.5);
    final periodSize = isMobile ? 11.0 : (isTablet ? 12.0 : 13.0);
    final bodySize = isMobile ? 11.0 : (isTablet ? 13.0 : 14.0);
    final cardRadius = isMobile ? 10.0 : 14.0;
    final cardPad = isMobile ? 12.0 : 16.0;
    final cardGap = isMobile ? 12.0 : 16.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: isMobile ? 8.0 : 12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.briefcase,
                      size: isMobile ? 18 : (isTablet ? 20 : 22),
                      color: theme.colorScheme.primary,
                    ),
                    SizedBox(width: isMobile ? 10 : 14),
                    Flexible(
                      child: Text(
                        'Research and Professional Experience',
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
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Hands-on roles spanning embedded systems, IoT instrumentation, and Tiny ML for next-generation embedded platforms.',
                style: theme.textTheme.bodyMedium?.copyWith(
                      height: 1.55,
                      fontSize: isMobile ? 11.5 : (isTablet ? 14.5 : 16),
                      color:
                          theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
                    ) ??
                    TextStyle(
                      height: 1.55,
                      fontSize: isMobile ? 13.5 : (isTablet ? 14.5 : 16),
                      color:
                          theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
                    ),
              ),

              SizedBox(height: isMobile ? 10 : 20),

              // Cards
              ..._experiences.map(
                (e) => _ExperienceCard(
                  item: e,
                  radius: cardRadius,
                  padding: cardPad,
                  marginBottom: cardGap,
                  roleSize: roleSize,
                  orgLocSize: orgLocSize,
                  periodSize: periodSize,
                  bodySize: bodySize,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({
    required this.item,
    required this.radius,
    required this.padding,
    required this.marginBottom,
    required this.roleSize,
    required this.orgLocSize,
    required this.periodSize,
    required this.bodySize,
  });

  final ExperienceItem item;
  final double radius;
  final double padding;
  final double marginBottom;

  final double roleSize;
  final double orgLocSize;
  final double periodSize;
  final double bodySize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final background =
        isDark ? theme.cardColor : theme.colorScheme.surface.withOpacity(0.98);

    String truncate(String s, [int max = 140]) {
      if (s.length <= max) return s;
      return '${s.substring(0, max - 1).trimRight()}\u2026';
    }

    // Prefer an explicit supervisor name when provided; otherwise fall back to
    // a generic label only if a prof link exists. Avoid returning the literal
    // same word for both label and value.
    String? supervisorName() {
      if (item.supervisor != null && item.supervisor!.trim().isNotEmpty) {
        return item.supervisor!.trim();
      }
      if (item.professorLink != null && item.professorLink!.isNotEmpty) {
        return null; // we will show a generic clickable label only when needed
      }
      return null;
    }

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: marginBottom),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.35)),
        boxShadow: isDark
            ? const []
            : [
                BoxShadow(
                  color: theme.colorScheme.primary.withOpacity(0.5),
                  blurRadius: 16,
                  offset: const Offset(0, 10),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: Role left, Period right
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.role,
                  style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: roleSize,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.25,
                        color: theme.colorScheme.primary,
                      ) ??
                      TextStyle(
                        fontSize: roleSize,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.25,
                        color: theme.colorScheme.primary,
                      ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                item.period,
                style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: periodSize,
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                    ) ??
                    TextStyle(
                      fontSize: periodSize,
                      color: theme.textTheme.bodySmall?.color?.withOpacity(0.7),
                    ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Lab (organization) + optional professor name (if parsable)
          // Group (lab) line
          Text(
            item.organization,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: orgLocSize,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
              color: theme.textTheme.bodySmall?.color?.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 4),

          // Supervisor line: prefer explicit `item.supervisor`. If a supervisor
          // name exists, show it; otherwise, if a professor link exists show a
          // clickable "Supervisor" label that opens the link.
          Builder(builder: (ctx) {
            final sup = supervisorName();
            final hasLink =
                item.professorLink != null && item.professorLink!.isNotEmpty;

            if (sup == null && !hasLink) return const SizedBox.shrink();

            final label = Text(
              'Supervisor: ',
              style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: orgLocSize,
                    fontWeight: FontWeight.w600,
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.85),
                  ) ??
                  TextStyle(
                    fontSize: orgLocSize,
                    fontWeight: FontWeight.w600,
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.85),
                  ),
            );

            Widget nameWidget;
            if (sup != null) {
              nameWidget = Text(
                sup,
                style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: orgLocSize,
                      fontWeight: FontWeight.w600,
                      color:
                          theme.textTheme.bodySmall?.color?.withOpacity(0.85),
                    ) ??
                    TextStyle(
                      fontSize: orgLocSize,
                      fontWeight: FontWeight.w600,
                      color:
                          theme.textTheme.bodySmall?.color?.withOpacity(0.85),
                    ),
              );
              // If a link exists, wrap the explicit name to make it clickable.
              if (hasLink) {
                nameWidget = GestureDetector(
                  onTap: () async {
                    final uri = Uri.parse(item.professorLink!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri,
                          mode: LaunchMode.externalApplication);
                    }
                  },
                  child: nameWidget,
                );
              }
            } else {
              // No explicit name; show generic clickable label when link exists.
              nameWidget = GestureDetector(
                onTap: () async {
                  final uri = Uri.parse(item.professorLink!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                child: Text(
                  'Supervisor',
                  style: TextStyle(
                    fontSize: orgLocSize,
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                  ),
                ),
              );
            }

            return Row(
              children: [
                label,
                Flexible(child: nameWidget),
              ],
            );
          }),

          const SizedBox(height: 8),

          // Highlights (concise)
          ...item.highlights.take(3).map(
                (line) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // bullet
                      Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          truncate(line, 120),
                          style: theme.textTheme.bodyMedium?.copyWith(
                                fontSize: bodySize,
                                height: 1.55,
                                color: theme.textTheme.bodyMedium?.color,
                              ) ??
                              TextStyle(
                                fontSize: bodySize,
                                height: 1.55,
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
}

class _SummaryWithLink extends StatelessWidget {
  const _SummaryWithLink({
    required this.summary,
    required this.professorLink,
    required this.bodySize,
  });

  final String summary;
  final String? professorLink;
  final double bodySize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (professorLink == null || professorLink!.isEmpty) {
      return Text(
        summary,
        style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: bodySize,
              height: 1.55,
              color: theme.textTheme.bodyMedium?.color,
            ) ??
            TextStyle(
              fontSize: bodySize,
              height: 1.55,
              color: theme.textTheme.bodyMedium?.color,
            ),
      );
    }

    // Try extracting a professor name after "with / Working with / Supporting / Collaborating with"
    final professorPatterns = [
      RegExp(r'with\s+([^,]+)', caseSensitive: false),
      RegExp(r'Working with\s+([^,]+)', caseSensitive: false),
      RegExp(r'Supporting\s+([^,]+)', caseSensitive: false),
      RegExp(r'Collaborating with\s+([^,]+)', caseSensitive: false),
    ];

    String? profName;
    for (final p in professorPatterns) {
      final m = p.firstMatch(summary);
      if (m != null && m.groupCount >= 1) {
        profName = m.group(1)?.trim();
        break;
      }
    }

    if (profName == null) {
      return Text(
        summary,
        style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: bodySize,
              height: 1.55,
              color: theme.textTheme.bodyMedium?.color,
            ) ??
            TextStyle(
              fontSize: bodySize,
              height: 1.55,
              color: theme.textTheme.bodyMedium?.color,
            ),
      );
    }

    final parts = summary.split(profName);
    if (parts.length != 2) {
      return Text(
        summary,
        style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: bodySize,
              height: 1.55,
              color: theme.textTheme.bodyMedium?.color,
            ) ??
            TextStyle(
              fontSize: bodySize,
              height: 1.55,
              color: theme.textTheme.bodyMedium?.color,
            ),
      );
    }

    return RichText(
      text: TextSpan(
        style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: bodySize,
              height: 1.55,
              color: theme.textTheme.bodyMedium?.color,
            ) ??
            TextStyle(
              fontSize: bodySize,
              height: 1.55,
              color: theme.textTheme.bodyMedium?.color,
            ),
        children: [
          TextSpan(text: parts[0]),
          TextSpan(
            text: profName,
            style: TextStyle(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                final uri = Uri.parse(professorLink!);
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
