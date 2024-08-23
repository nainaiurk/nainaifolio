import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/education.dart';

class EducationSection extends StatelessWidget {
  @override
  final Key? key;

  EducationSection({this.key}) : super(key: key);

  final List<Education> educationList = [
    // Education(
    //   degree: 'Master of Science in Computer Science',
    //   institution: 'XYZ University',
    //   duration: '2018 - 2020',
    //   description: 'Specialized in Software Engineering.',
    // ),
    Education(
      degree: 'BSC Engineering in Electrical and Electronic Engineering',
      institution: 'Shahjalal Univeristy of Science and Technology, Sylhet',
      duration: '2020 - 2024',
      description: 'Focused on Power Electronics, Embedded Systems, Robotics',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0.0),
      // color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                FontAwesomeIcons.book,
                size: 40,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                "Educational Qualifications",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ...educationList.map((edu) => _buildEducationCard(edu, context)),
        ],
      ),
    );
  }

  Widget _buildEducationCard(Education education, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).primaryColor),
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
            education.degree,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            education.institution,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            education.duration,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            education.description,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ),
        ],
      ),
    );
  }
}
