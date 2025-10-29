import 'package:flutter/material.dart';

import 'top_navigation_bar.dart';

class PortfolioDrawer extends StatelessWidget {
  const PortfolioDrawer({super.key, required this.onSectionSelected});

  final ValueChanged<ScrollSection> onSectionSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              "Navigation",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            title: const Text('About Me'),
            onTap: () {
              Navigator.pop(context);
              onSectionSelected(ScrollSection.introduction);
            },
          ),
          ListTile(
            title: const Text('Expertise Areas'),
            onTap: () {
              Navigator.pop(context);
              onSectionSelected(ScrollSection.whatICanOffer);
            },
          ),
          ListTile(
            title: const Text('Experience'),
            onTap: () {
              Navigator.pop(context);
              onSectionSelected(ScrollSection.experience);
            },
          ),
          ListTile(
            title: const Text('Publications'),
            onTap: () {
              Navigator.pop(context);
              onSectionSelected(ScrollSection.publications);
            },
          ),
          ListTile(
            title: const Text('Projects'),
            onTap: () {
              Navigator.pop(context);
              onSectionSelected(ScrollSection.projects);
            },
          ),
          ListTile(
            title: const Text('Skills'),
            onTap: () {
              Navigator.pop(context);
              onSectionSelected(ScrollSection.skills);
            },
          ),
          ListTile(
            title: const Text('Leadership'),
            onTap: () {
              Navigator.pop(context);
              onSectionSelected(ScrollSection.leadership);
            },
          ),
          ListTile(
            title: const Text('Awards & Certifications'),
            onTap: () {
              Navigator.pop(context);
              onSectionSelected(ScrollSection.awards);
            },
          ),
          ListTile(
            title: const Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              onSectionSelected(ScrollSection.contact);
            },
          ),
        ],
      ),
    );
  }
}
