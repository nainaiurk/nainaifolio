import 'package:flutter/material.dart';
// Use locally-bundled fonts declared in pubspec.yaml to avoid remote font fetches.
import '../utils/responsive.dart';

enum ScrollSection {
  introduction,
  whatICanOffer,
  education,
  experience,
  leadership,
  awards,
  publications,
  skills,
  projects,
  contact
}

class TopNavigationBar extends StatelessWidget {
  final Function(ScrollSection) onItemSelected;

  const TopNavigationBar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor.withOpacity(0.9),
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.secondary.withOpacity(0.4),
            width: 0.6,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: _buildLogo(context),
          ),
          if (Responsive.isDesktop(context))
            Flexible(
              flex: 3,
              child: _buildDesktopNavItems(context),
            )
          else
            _buildHamburgerMenu(context),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      Responsive.isMobile(context) ? 'Nainaiu' : 'Nainaiu Rakhaine',
      style: TextStyle(
        fontFamily: 'Merriweather',
        fontSize: Responsive.isMobile(context) ? 16 : 22,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        color: theme.colorScheme.primary,
      ),
    );
  }

  Widget _buildDesktopNavItems(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildNavItem(context, 'Intro', ScrollSection.introduction),
          _buildNavItem(context, 'Expertise', ScrollSection.whatICanOffer),
          _buildNavItem(context, 'Education', ScrollSection.education),
          _buildNavItem(context, 'Experience', ScrollSection.experience),
          _buildNavItem(context, 'Publications', ScrollSection.publications),
          _buildNavItem(context, 'Projects', ScrollSection.projects),
          _buildNavItem(context, 'Skills', ScrollSection.skills),
          _buildNavItem(context, 'Leadership', ScrollSection.leadership),
          _buildNavItem(context, 'Awards', ScrollSection.awards),
          _buildNavItem(context, 'Contact', ScrollSection.contact),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, String title, ScrollSection section) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 8.0 : 12.0,
      ),
      child: InkWell(
        onTap: () => onItemSelected(section),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Builder(builder: (inner) {
            final theme = Theme.of(inner);
            return Text(
              title,
              style: TextStyle(
                fontFamily: 'Lora',
                color: theme.colorScheme.primary,
                fontSize: Responsive.isMobile(context) ? 14 : 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _buildHamburgerMenu(BuildContext context) {
    final theme = Theme.of(context);
    return PopupMenuButton<ScrollSection>(
      icon: Icon(Icons.menu, color: theme.colorScheme.primary),
      onSelected: (section) => onItemSelected(section),
      itemBuilder: (context) => <PopupMenuEntry<ScrollSection>>[
        _buildPopupMenuItem('Introduction', ScrollSection.introduction),
        _buildPopupMenuItem('Expertise Areas', ScrollSection.whatICanOffer),
        _buildPopupMenuItem('Education', ScrollSection.education),
        _buildPopupMenuItem('Experience', ScrollSection.experience),
        _buildPopupMenuItem('Publications', ScrollSection.publications),
        _buildPopupMenuItem('Leadership', ScrollSection.leadership),
        _buildPopupMenuItem('Projects', ScrollSection.projects),
        _buildPopupMenuItem('Skills', ScrollSection.skills),
        _buildPopupMenuItem('Awards & Certifications', ScrollSection.awards),
        _buildPopupMenuItem('Contact', ScrollSection.contact),
      ],
    );
  }

  PopupMenuItem<ScrollSection> _buildPopupMenuItem(
      String title, ScrollSection section) {
    return PopupMenuItem<ScrollSection>(
      value: section,
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Lora',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
