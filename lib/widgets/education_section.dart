import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/education.dart';

class EducationSection extends StatelessWidget {
  final Key? key;

  EducationSection({this.key}) : super(key: key);

  static const double titleFontSize = 28;

  final List<Education> educationList = [
    Education(
      degree: 'BSC Engineering in Electrical and Electronic Engineering',
      institution: 'Shahjalal Univeristy of Science and Technology, Sylhet',
      duration: '2020 - 2024',
      description: 'Focused on Power Electronics, Embedded Systems, Robotics',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.book,
                size: 24,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 16),
              Text(
                'Educational Qualifications',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ...educationList.map((edu) => _buildEducationCard(context, edu)),
        ],
      ),
    );
  }

  Widget _buildEducationCard(BuildContext context, Education education) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.6)),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondary.withOpacity(0.12),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            education.degree,
            style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ) ??
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            education.institution,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Text(
            education.duration,
            style: theme.textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          Text(
            education.description,
            style: theme.textTheme.bodyMedium?.copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}
