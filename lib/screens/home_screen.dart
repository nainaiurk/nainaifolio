import 'package:flutter/material.dart';
import '../widgets/animated_header.dart';
import '../widgets/top_navigation_bar.dart';
import '../widgets/introduction_section.dart';
import '../widgets/education_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/publications_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey introKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey publicationsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const AnimatedHeader(),
                IntroductionSection(key: introKey),
                EducationSection(key: educationKey),
                ExperienceSection(key: experienceKey),
                PublicationsSection(key: publicationsKey),
                ContactSection(key: contactKey),
                const Footer(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: TopNavigationBar(
              onItemSelected: (section) {
                switch (section) {
                  case ScrollSection.introduction:
                    scrollToSection(introKey);
                    break;
                  case ScrollSection.education:
                    scrollToSection(educationKey);
                    break;
                  case ScrollSection.experience:
                    scrollToSection(experienceKey);
                    break;
                  case ScrollSection.publications:
                    scrollToSection(publicationsKey);
                    break;
                  case ScrollSection.contact:
                    scrollToSection(contactKey);
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
