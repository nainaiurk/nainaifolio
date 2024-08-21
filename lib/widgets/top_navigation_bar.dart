import 'package:flutter/material.dart';

enum ScrollSection {
  introduction,
  education,
  experience,
  publications,
  contact
}

class TopNavigationBar extends StatelessWidget {
  final Function(ScrollSection) onItemSelected;
  const TopNavigationBar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(context),
          _buildNavItems(context),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Text(
      'My Portfolio',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildNavItems(BuildContext context) {
    return Row(
      children: [
        _buildNavItem(context, "Introduction", ScrollSection.introduction),
        _buildNavItem(context, "Education", ScrollSection.education),
        _buildNavItem(context, "Experience", ScrollSection.experience),
        _buildNavItem(context, "Publications", ScrollSection.publications),
        _buildNavItem(context, "Contact", ScrollSection.contact),
      ],
    );
  }

  Widget _buildNavItem(
      BuildContext context, String title, ScrollSection section) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () => onItemSelected(section),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
