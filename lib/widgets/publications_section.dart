import 'package:flutter/material.dart';

class PublicationsSection extends StatelessWidget {
  @override
  final Key? key;

  PublicationsSection({this.key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Publications",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyLarge!.color),
          ),
          const SizedBox(height: 30),
          ...publicationsList.map((pub) => _buildPublicationCard(pub, context)),
        ],
      ),
    );
  }

  Widget _buildPublicationCard(
      Map<String, String> publication, BuildContext context) {
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
            publication['title']!,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.bodyMedium!.color),
          ),
          const SizedBox(height: 8),
          Text(
            publication['year']!,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            publication['abstract']!,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Open the link
              },
              child: Text(
                'Read More',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
