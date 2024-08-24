import 'package:flutter/material.dart';
import '../utils/responsive.dart';

enum ScrollSection {
  introduction,
  whatICanOffer,
  education,
  experience,
  publications,
  skills,
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
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLogo(context),
          if (Responsive.isDesktop(context))
            _buildDesktopNavItems(context)
          else
            _buildHamburgerMenu(context),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Text(
      '(Nai)^2_U',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildDesktopNavItems(BuildContext context) {
    return Row(
      children: [
        _buildNavItem(context, "Introduction", ScrollSection.introduction),
        _buildNavItem(
            context, "What I Can Offer?", ScrollSection.whatICanOffer),
        _buildNavItem(context, "Education", ScrollSection.education),
        _buildNavItem(context, "Experience", ScrollSection.experience),
        _buildNavItem(context, "Publications", ScrollSection.publications),
        _buildNavItem(context, "Skills", ScrollSection.skills),
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
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHamburgerMenu(BuildContext context) {
    return PopupMenuButton<ScrollSection>(
      icon: Icon(Icons.menu, color: Theme.of(context).primaryColor),
      onSelected: (section) => onItemSelected(section),
      itemBuilder: (context) => <PopupMenuEntry<ScrollSection>>[
        _buildPopupMenuItem("Introduction", ScrollSection.introduction),
        _buildPopupMenuItem("What I Can Offer?", ScrollSection.whatICanOffer),
        _buildPopupMenuItem("Education", ScrollSection.education),
        _buildPopupMenuItem("Experience", ScrollSection.experience),
        _buildPopupMenuItem("Publications", ScrollSection.publications),
        _buildPopupMenuItem("Skills", ScrollSection.skills),
        _buildPopupMenuItem("Contact", ScrollSection.contact),
      ],
    );
  }

  PopupMenuItem<ScrollSection> _buildPopupMenuItem(
      String title, ScrollSection section) {
    return PopupMenuItem<ScrollSection>(
      value: section,
      child: Text(title),
    );
  }
}
