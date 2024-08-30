import 'package:flutter/material.dart';
import 'package:nainaifolio/utils/constant.dart';
import 'package:nainaifolio/widgets/portfolio_drawer.dart';
import 'package:nainaifolio/widgets/projects_section.dart';
import 'package:nainaifolio/widgets/what_i_can_offer_section.dart';
import '../widgets/animated_header.dart';
import '../widgets/skills_section.dart';
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
  final GlobalKey whatICanOfferKey = GlobalKey();
  final GlobalKey educationKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey publicationsKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  late ScrollController _scrollController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _simulateLoading(); // Simulate loading time
  }

  void _simulateLoading() async {
    // Simulate a delay for loading
    await Future.delayed(const Duration(seconds: 3)); // 3 seconds loading time
    setState(() {
      _isLoading = false;
    });
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
      drawer: const PortfolioDrawer(),
      body: Stack(
        children: [
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(), // Show loading animation
            )
          else
            Container(
              padding:
                  EdgeInsets.symmetric(horizontal: getMaxWidth(context) * 0.05),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    const AnimatedHeader(),
                    IntroductionSection(key: introKey),
                    WhatICanOfferSection(key: whatICanOfferKey),
                    EducationSection(key: educationKey),
                    ExperienceSection(key: experienceKey),
                    PublicationsSection(key: publicationsKey),
                    SkillsSection(key: skillsKey),
                    ProjectsSection(key: projectsKey),
                    ContactSection(key: contactKey),
                    const Footer(),
                  ],
                ),
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
                  case ScrollSection.whatICanOffer:
                    scrollToSection(whatICanOfferKey);
                    break;
                  case ScrollSection.skills:
                    scrollToSection(skillsKey);
                    break;
                  case ScrollSection.projects:
                    scrollToSection(projectsKey);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
