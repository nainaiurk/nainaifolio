import 'package:flutter/material.dart';
import '../models/experience.dart';
import '../utils/responsive.dart';

class ExperienceSection extends StatelessWidget {
  final List<Experience> experienceList = [
    Experience(
      title: 'Senior Developer at XYZ Corp',
      duration: 'Jan 2020 - Present',
      description:
          'Leading a team of developers to build enterprise-level applications.',
    ),
    Experience(
      title: 'Flutter Developer at ABC Ltd',
      duration: 'Jun 2018 - Dec 2019',
      description:
          'Developed cross-platform mobile apps using Flutter and Dart.',
    ),
    Experience(
      title: 'Software Engineer at DEF Inc',
      duration: 'Jan 2016 - May 2018',
      description:
          'Worked on various web development projects using modern technologies.',
    ),
  ];

  ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Experience",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Responsive(
            mobile: Column(
              children: experienceList
                  .map((exp) => _buildExperienceCard(exp))
                  .toList(),
            ),
            tablet: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: experienceList
                  .map((exp) => _buildExperienceCard(exp))
                  .toList(),
            ),
            desktop: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: experienceList
                  .map((exp) => _buildExperienceCard(exp))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(Experience experience) {
    return Card(
      child: ListTile(
        title: Text(experience.title),
        subtitle: Text('${experience.duration}\n${experience.description}'),
      ),
    );
  }
}
