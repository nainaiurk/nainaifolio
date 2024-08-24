import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../models/skill_item.dart';

class SkillsSection extends StatelessWidget {
  final Key? key;
  final List<SkillItem> skills = [
    SkillItem(label: "PCB Design", level: 0.85),
    SkillItem(label: "RTOS", level: 0.75),
    SkillItem(label: "Microcontrollers", level: 0.80),
    SkillItem(label: "Flutter", level: 0.90),
    SkillItem(label: "Matlab", level: 0.70),
    SkillItem(label: "TinyML", level: 0.65),
    SkillItem(label: "AutoCAD", level: 0.60),
    SkillItem(label: "Python", level: 0.88),
  ];

  SkillsSection({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            children: [
              const Icon(FontAwesomeIcons.screwdriverWrench, size: 40),
              const SizedBox(width: 20),
              Text(
                "Skills",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Skills List
          Column(
            children:
                skills.map((skill) => _buildSkillItem(context, skill)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillItem(BuildContext context, SkillItem skill) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill.label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          const SizedBox(height: 8),
          LinearPercentIndicator(
            lineHeight: 20.0,
            width: MediaQuery.of(context).size.width * 0.6,
            percent: skill.level,
            backgroundColor: Theme.of(context).textTheme.bodySmall!.color,
            progressColor: Theme.of(context).canvasColor,
            barRadius: const Radius.circular(10),
            animation: true,
            animationDuration: 2000,
          ),
        ],
      ),
    );
  }
}
