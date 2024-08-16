import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class PublicationsSection extends StatelessWidget {
  final List<Map<String, String>> publicationsList = [
    {
      'title': 'Flutter for Beginners',
      'year': '2021',
      'link': 'https://example.com/flutter-for-beginners',
      'abstract': 'An introductory guide to Flutter development.',
    },
    {
      'title': 'Advanced Dart Programming',
      'year': '2020',
      'link': 'https://example.com/advanced-dart',
      'abstract': 'A deep dive into Dart for experienced programmers.',
    },
  ];

  PublicationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Publications",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Responsive(
            mobile: Column(
              children: publicationsList
                  .map((pub) => _buildPublicationCard(pub))
                  .toList(),
            ),
            tablet: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: publicationsList
                  .map((pub) => _buildPublicationCard(pub))
                  .toList(),
            ),
            desktop: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: publicationsList
                  .map((pub) => _buildPublicationCard(pub))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPublicationCard(Map<String, String> publication) {
    return Card(
      child: ListTile(
        title: Text(publication['title']!),
        subtitle: Text('${publication['year']!}\n${publication['abstract']!}'),
        trailing: IconButton(
          icon: const Icon(Icons.link),
          onPressed: () {
            // Open the link
          },
        ),
      ),
    );
  }
}
