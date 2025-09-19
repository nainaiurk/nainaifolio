import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/offer_item.dart';

class ExpertiseAreasSection extends StatelessWidget {
  const ExpertiseAreasSection({super.key});

  static const double _titleFontSize = 28;

  static const List<OfferItem> _offers = [
    OfferItem(
      icon: FontAwesomeIcons.microchip,
      label: 'Embedded Systems & IoT Research',
      description:
          'Can design System on Chip(SoC) devices using compact PCB design. Integrate to low-power ESP32/STM32 platforms, IoT pipelines, and resilient data acquisition for ready autonomous systems.',
      color: Color(0xFF1A2B4C),
    ),
    OfferItem(
      icon: FontAwesomeIcons.robot,
      label: 'Robotics Systems',
      description:
          'Integrated perception, control, and hardware stacks for Autonomous Ground Vehicle and AUV teams, delivering reliable robotics modules at scale.',
      color: Color(0xFF25385C),
    ),
    OfferItem(
      icon: FontAwesomeIcons.brain,
      label: 'TinyML & Edge Intelligence',
      description:
          'Deploying TinyML frameworks for low powered embedded devices(Microcontrollers) optimizing edge inference for sustainable monitoring.',
      color: Color(0xFF3B4F73),
    ),
    OfferItem(
      icon: FontAwesomeIcons.penNib,
      label: 'Publications & Technical Writing',
      description:
          'Authoring Q2 journal and IEEE conference papers while developing instructional PCB design content for academic and industry learners.',
      color: Color(0xFF51658C),
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
          Row(
            children: [
              Icon(
                FontAwesomeIcons.solidCircleCheck,
                size: 24,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 16),
              Text('Expertise Areas', style: headingStyle),
            ],
          ),
          // const SizedBox(height: 16),
          // Text(
          //   'Click on any expertise area below to explore detailed information about my specialized skills and experience.',
          //   style: descriptionStyle,
          // ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 3.2,
            ),
            itemCount: _offers.length,
            itemBuilder: (context, index) =>
                _CompactOfferCard(item: _offers[index]),
          ),
        ],
      ),
    );
  }
}

class _CompactOfferCard extends StatelessWidget {
  const _CompactOfferCard({required this.item});

  final OfferItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final background =
        isDark ? theme.cardColor : theme.colorScheme.surface.withOpacity(0.98);

    return InkWell(
      onTap: () => _showDetailsDialog(context),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: item.color.withOpacity(0.3),
            width: 1,
          ),
          boxShadow: isDark
              ? const []
              : [
                  BoxShadow(
                    color: item.color.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: item.color.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: FaIcon(
                  item.icon,
                  size: 18,
                  color: item.color,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      item.label,
                      style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                            color: theme.colorScheme.primary,
                            fontSize: 14,
                          ) ??
                          TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.3,
                            color: theme.colorScheme.primary,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Flexible(
                    child: Text(
                      'Tap for details',
                      style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.textTheme.bodySmall?.color
                                ?.withOpacity(0.8),
                            fontSize: 9,
                          ) ??
                          TextStyle(
                            fontSize: 9,
                            color: theme.textTheme.bodySmall?.color
                                ?.withOpacity(0.8),
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 10,
              color: item.color.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }

  void _showDetailsDialog(BuildContext context) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: item.color.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: FaIcon(
                          item.icon,
                          size: 24,
                          color: item.color,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        item.label,
                        style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary,
                            ) ??
                            TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  item.description,
                  style: theme.textTheme.bodyLarge?.copyWith(
                        height: 1.6,
                        color: theme.textTheme.bodyLarge?.color,
                      ) ??
                      TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: item.color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
