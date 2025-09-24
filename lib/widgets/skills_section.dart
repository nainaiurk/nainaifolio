import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// removed percent_indicator package usage; using a custom progress bar

import '../models/skill_item.dart';

class SkillsSection extends StatelessWidget {
  final Key? key;

  SkillsSection({this.key}) : super(key: key);

  // title font handled via responsive variables in build()

  // Organized skill categories for CV-style presentation
  final Map<String, List<SkillItem>> skillCategories = {
    'Embedded Development Tools': [
      SkillItem(label: 'PlatformIO', level: 0.85),
      SkillItem(label: 'STM32CubeIDE', level: 0.80),
      SkillItem(label: 'Arduino IDE', level: 0.90),
    ],
    'Microcontrollers & Microprocessors': [
      SkillItem(label: 'ESP32', level: 0.88),
      SkillItem(label: 'STM32', level: 0.85),
      SkillItem(label: 'Raspberry Pi Pico', level: 0.75),
      SkillItem(label: 'Raspberry Pi', level: 0.75),
      SkillItem(label: 'Jetson Nano', level: 0.75),
    ],
    'RTOS & Embedded ML': [
      SkillItem(label: 'FreeRTOS', level: 1.00),
      SkillItem(label: 'TensorFlow Lite', level: 0.8),
    ],
    'IoT & Communication Protocols': [
      SkillItem(label: 'MQTT', level: 0.85),
      SkillItem(label: 'LoRa', level: 0.75),
      SkillItem(label: 'BLE', level: 0.80),
      SkillItem(label: 'WiFi', level: 0.88),
      SkillItem(label: 'GSM', level: 0.70),
    ],
    'Programming Languages': [
      SkillItem(label: 'C/C++', level: 0.90),
      SkillItem(label: 'Python', level: 0.85),
      SkillItem(label: 'MATLAB', level: 0.75),
    ],
    'PCB Design & CAD Tools': [
      SkillItem(label: 'EasyEDA', level: 0.85),
      SkillItem(label: 'Altium Designer', level: 0.75),
      SkillItem(label: 'AutoCAD', level: 0.70),
      SkillItem(label: 'FreeCAD', level: 0.65),
    ],
    'Simulation & Analysis': [
      SkillItem(label: 'LTSpice', level: 0.80),
      SkillItem(label: 'Proteus', level: 0.75),
      SkillItem(label: 'MATLAB Simulink', level: 0.70),
    ],
    'Currently Learning': [
      SkillItem(label: 'FPGA', level: 0.40),
      SkillItem(label: 'Rust', level: 0.30),
      SkillItem(label: 'Zephyr RTOS', level: 0.25),
    ],
  };

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

  final titleFont = isMobile ? 18.0 : (isTablet ? 20.0 : 28.0);
    final headingStyle = theme.textTheme.headlineSmall?.copyWith(
      fontSize: titleFont,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.6,
      color: theme.colorScheme.primary,
    );

    final sectionV = rem(3.5);
    final sectionH = isMobile ? 16.0 : 24.0;
    final preCardGap = isMobile ? 10.0 : 20.0;

    final wrapSpacing = isMobile ? 12.0 : 16.0;
    final wrapRunSpacing = isMobile ? 12.0 : 16.0;
    // On mobile compute width so 3 cards fit per row (accounting for paddings)
    final cardWidth = isMobile
        ? (((w - 2 * sectionH - 2 * wrapSpacing) / 3).clamp(70.0, 120.0))
            .toDouble()
        : 220.0;
    final cardPad = isMobile ? 5.0 : 10.0;
    final cardRadius = isMobile ? 10.0 : 16.0;
    final titleIconSize = isMobile ? 18.0 : (isTablet ? 20.0 : 24.0);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: sectionV, horizontal: sectionH),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(FontAwesomeIcons.screwdriverWrench,
                  size: titleIconSize, color: theme.colorScheme.primary),
              SizedBox(width: isMobile ? 10 : 20),
              Text(
                "Technical Skills",
                style: headingStyle,
              ),
            ],
          ),
          SizedBox(height: isMobile ? 8 : 16),
          Text(
            'Specialized expertise in embedded systems development, IoT solutions, and hardware-software integration',
            style: theme.textTheme.bodyMedium?.copyWith(
                  height: 1.55,
                  fontSize: isMobile ? 11.5 : (isTablet ? 14.5 : 16),
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
                ) ??
                TextStyle(
                  fontSize: isMobile ? 13.5 : (isTablet ? 14.5 : 16),
                  height: 1.55,
                  color: theme.colorScheme.onSurface.withOpacity(0.85),
                ),
          ),
          SizedBox(height: preCardGap),
          ...skillCategories.entries.map((category) => _buildSkillCategory(
              context,
              category.key,
              category.value,
              cardWidth,
              cardPad,
              cardRadius,
              wrapSpacing,
              wrapRunSpacing)),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
    BuildContext context,
    String categoryName,
    List<SkillItem> skills,
    double cardWidth,
    double cardPad,
    double cardRadius,
    double wrapSpacing,
    double wrapRunSpacing,
  ) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0), // Reduced from 32.0
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Header - More Compact
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: theme.colorScheme.secondary,
                width: 1,
              ),
            ),
            child: Text(
              categoryName,
              style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                    letterSpacing: 0.3,
                    fontSize: 12,
                  ) ??
                  TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                    letterSpacing: 0.3,
                  ),
            ),
          ),
          // Skills Grid - More Compact
          Wrap(
            spacing: wrapSpacing,
            runSpacing: wrapRunSpacing,
            children: skills
                .map((skill) => _buildSkillCard(
                    context, skill, cardWidth, cardPad, cardRadius))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(BuildContext context, SkillItem skill,
      double cardWidth, double cardPad, double cardRadius) {
    final theme = Theme.of(context);

    return Container(
      width: cardWidth,
      padding: EdgeInsets.all(cardPad),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(cardRadius),
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.15),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondary.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Skill Name
          Text(
            skill.label,
            style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                  fontSize: 12,
                ) ??
                TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
          ),
          SizedBox(height: cardPad * 0.6),
          // Progress Bar: explicitly align left and size to card content width
          LayoutBuilder(builder: (ctx, constraints) {
            final barWidth = constraints.maxWidth;
            final lineH = cardPad > 12 ? 8.0 : 4.0;
            return Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: barWidth,
                height: lineH,
                child: Stack(
                  children: [
                    Container(
                      width: barWidth,
                      height: lineH,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surface.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: skill.level.clamp(0.0, 1.0),
                      child: Container(
                        height: lineH,
                        decoration: BoxDecoration(
                          color: _getProgressColor(skill.level, theme),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Color _getProgressColor(double level, ThemeData theme) {
    if (level >= 0.8) {
      return theme.colorScheme.primary; // Expert level
    } else if (level >= 0.7) {
      return theme.colorScheme.secondary; // Advanced level
    } else if (level >= 0.6) {
      return Colors.orange; // Intermediate level
    } else {
      return Colors.blueGrey; // Beginner level
    }
  }
}
