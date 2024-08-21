import 'package:flutter/material.dart';
import '../models/experience.dart';

class ExperienceSection extends StatelessWidget {
  final Key key;
  ExperienceSection({required this.key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Experience",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          const SizedBox(height: 30),
          ...experienceList.map((exp) => _buildExperienceCard(exp, context)),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(Experience experience, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            experience.duration,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            experience.description,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
        ],
      ),
    );
  }
}
