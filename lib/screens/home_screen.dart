import 'package:flutter/material.dart';
import '../widgets/animated_header.dart';
import '../widgets/portfolio_drawer.dart';
import '../widgets/top_navigation_bar.dart';
import '../widgets/introduction_section.dart';
import '../widgets/education_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/publications_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';
import '../utils/scroll_to_section.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey introKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey publicationsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PortfolioDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: AnimatedHeader(),
            pinned: true,
          ),
          SliverPersistentHeader(
            delegate: TopNavigationBar(
              onItemSelected: (section) {
                switch (section) {
                  case ScrollSection.Introduction:
                    ScrollToSection.scrollTo(introKey);
                    break;
                  case ScrollSection.Education:
                    ScrollToSection.scrollTo(educationKey);
                    break;
                  case ScrollSection.Experience:
                    ScrollToSection.scrollTo(experienceKey);
                    break;
                  case ScrollSection.Publications:
                    ScrollToSection.scrollTo(publicationsKey);
                    break;
                  case ScrollSection.Contact:
                    ScrollToSection.scrollTo(contactKey);
                    break;
                }
              },
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                IntroductionSection(key: introKey),
                EducationSection(key: educationKey),
                ExperienceSection(key: experienceKey),
                PublicationsSection(key: publicationsKey),
                ContactSection(key: contactKey),
                const Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
