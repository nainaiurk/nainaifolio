import 'package:flutter/material.dart';

class PortfolioDrawer extends StatelessWidget {
  const PortfolioDrawer({super.key});

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
              // Scroll to About Me section
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Experience'),
            onTap: () {
              // Scroll to Experience section
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Publications'),
            onTap: () {
              // Scroll to Publications section
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Contact'),
            onTap: () {
              // Scroll to Contact section
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
