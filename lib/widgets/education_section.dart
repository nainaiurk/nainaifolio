import 'package:flutter/material.dart';
import '../models/education.dart';
import '../utils/responsive.dart';

class EducationSection extends StatelessWidget {
  final List<Education> educationList = [
    Education(
      degree: 'Master of Science in Computer Science',
      institution: 'XYZ University',
      duration: '2018 - 2020',
      description: 'Specialized in Software Engineering.',
    ),
    Education(
      degree: 'Bachelor of Technology in Information Technology',
      institution: 'ABC College',
      duration: '2014 - 2018',
      description: 'Focused on full-stack development.',
    ),
  ];

  EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Educational Qualifications",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Responsive(
            mobile: Column(
              children:
                  educationList.map((edu) => _buildEducationCard(edu)).toList(),
            ),
            tablet: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children:
                  educationList.map((edu) => _buildEducationCard(edu)).toList(),
            ),
            desktop: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children:
                  educationList.map((edu) => _buildEducationCard(edu)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard(Education education) {
    return Card(
      child: ListTile(
        title: Text(education.degree),
        subtitle: Text(
            '${education.institution}\n${education.duration}\n${education.description}'),
      ),
    );
  }
}
