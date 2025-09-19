import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../models/skill_item.dart';

class SkillsSection extends StatelessWidget {
  final Key? key;

  SkillsSection({this.key}) : super(key: key);

  static const double _titleFontSize = 28;

  // Organized skill categories for CV-style presentation
  final Map<String, List<SkillItem>> skillCategories = {
    'Embedded Development Tools': [
      SkillItem(label: 'PlatformIO', level: 0.85),
      SkillItem(label: 'STM32CubeIDE', level: 0.80),
      SkillItem(label: 'Arduino IDE', level: 0.90),
    ],
    'Microcontrollers & Platforms': [
      SkillItem(label: 'ESP32', level: 0.88),
      SkillItem(label: 'STM32', level: 0.85),
      SkillItem(label: 'Raspberry Pi Pico', level: 0.75),
    ],
    'RTOS & Embedded OS': [
      SkillItem(label: 'FreeRTOS', level: 0.80),
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
    ],
    'Currently Learning': [
      SkillItem(label: 'FPGA', level: 0.40),
    ],
  };

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(FontAwesomeIcons.screwdriverWrench,
                  size: 24, color: theme.colorScheme.primary),
              const SizedBox(width: 20),
              Text(
                "Technical Skills",
                style: headingStyle,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Specialized expertise in embedded systems development, IoT solutions, and hardware-software integration',
            style: theme.textTheme.bodyMedium?.copyWith(
                  height: 1.6,
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
                ) ??
                TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: theme.colorScheme.onSurface.withOpacity(0.85),
                ),
          ),
          const SizedBox(height: 40),
          ...skillCategories.entries.map((category) =>
              _buildSkillCategory(context, category.key, category.value)),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(
      BuildContext context, String categoryName, List<SkillItem> skills) {
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
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: theme.colorScheme.primary.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Text(
              categoryName,
              style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                    letterSpacing: 0.3,
                    fontSize: 14,
                  ) ??
                  TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                    letterSpacing: 0.3,
                  ),
            ),
          ),
          // Skills Grid - More Compact
          Wrap(
            spacing: 12, // Reduced from 16
            runSpacing: 12, // Reduced from 16
            children:
                skills.map((skill) => _buildSkillCard(context, skill)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(BuildContext context, SkillItem skill) {
    final theme = Theme.of(context);

    return Container(
      width: 220, // Further reduced for compact layout
      padding: const EdgeInsets.all(12), // Reduced from 16 for compact layout
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12), // Reduced from 16
        border: Border.all(
          color: theme.colorScheme.primary.withOpacity(0.15), // Reduced opacity
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondary
                .withOpacity(0.08), // Reduced opacity
            blurRadius: 8, // Reduced from 12
            offset: const Offset(0, 2), // Reduced from (0, 4)
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
                  fontSize: 14,
                ) ??
                TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 8), // Further reduced for compact layout
          // Progress Bar
          LinearPercentIndicator(
            lineHeight: 6.0, // Reduced from 8.0
            percent: skill.level,
            backgroundColor: theme.colorScheme.surface.withOpacity(0.3),
            progressColor: _getProgressColor(skill.level, theme),
            barRadius: const Radius.circular(3), // Reduced from 4
            animation: true,
            animationDuration: 1200, // Reduced from 1500
          ),
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

  String _getProficiencyText(double level) {
    if (level >= 0.8) {
      return 'Expert';
    } else if (level >= 0.7) {
      return 'Advanced';
    } else if (level >= 0.6) {
      return 'Intermediate';
    } else {
      return 'Beginner';
    }
  }
}
