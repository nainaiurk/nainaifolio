import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/project_item.dart';
import '../utils/responsive.dart';

class ProjectsSection extends StatelessWidget {
  final Key? key;

  ProjectsSection({this.key}) : super(key: key);

  final List<ProjectItem> projectList = [
    ProjectItem(
      title: 'Microcontroller Board Design',
      subtitle: 'Custom PCB for Embedded Systems',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZLJ4FenmNw7xBQ2KcebhDvJ7IKtYkqLz', // Replace with actual image
      documentationUrl: 'https://example.com/docs/microcontroller-board',
    ),
    ProjectItem(
      title: 'PCB Drones',
      subtitle: 'Design and Development of Drones',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZGET_Cgg8Q7w8fFHS2KSjtu5pL10Ac0n', // Replace with actual image
      documentationUrl: 'https://example.com/docs/pcb-drones',
    ),
    ProjectItem(
      title: 'AUV (Autonomous Underwater Vehicle)',
      subtitle: 'Design of Autonomous Underwater Vehicles',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZO5brHNF0UImesYNftWbbe93ArYloDRd', // Replace with actual image
      documentationUrl: 'https://example.com/docs/auv',
    ),
    ProjectItem(
      title: 'Electric Vehicle',
      subtitle: 'Electric Car Development',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZRRegB9bHrYeZ_4QCu-v5Z_VncM6FFRD', // Replace with actual image
      documentationUrl: 'https://example.com/docs/electric-vehicle',
    ),
    ProjectItem(
      title: 'Line Follower Robot',
      subtitle: 'Robotics and Automation',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZT-vIBzM1FTTGnj39H1K6vuZ2wINaXLs', // Replace with actual image
      documentationUrl: 'https://example.com/docs/line-follower-robot',
    ),
    ProjectItem(
      title: 'LoRa Messenger',
      subtitle: 'Long Range Communication Project',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZNiOikXJjXsQHgfMWLwObXjfePd-1bqE', // Replace with actual image
      documentationUrl: 'https://example.com/docs/lora-messenger',
    ),
    ProjectItem(
      title: 'Chat App',
      subtitle: 'Flutter-based Chat Application',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1VGx1PaYbVE2SbtOX2xAmT1_lNcz-zUGX', // Replace with actual image
      documentationUrl: 'https://example.com/docs/chat-app',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(FontAwesomeIcons.projectDiagram,
                  size: _getTitleIconSize(context)),
              const SizedBox(width: 20),
              Text(
                "Projects",
                style: TextStyle(
                  fontSize: _getTitleFontSize(context),
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          _buildStaggeredGridView(context),
        ],
      ),
    );
  }

  Widget _buildStaggeredGridView(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: _getCrossAxisCount(context),
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: projectList.length,
      itemBuilder: (context, index) {
        final item = projectList[index];
        return _buildProjectItem(item, context);
      },
    );
  }

  Widget _buildProjectItem(ProjectItem item, BuildContext context) {
    return InkWell(
      onTap: () => _launchURL(item.documentationUrl),
      child: Stack(
        children: [
          // Project Image
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              item.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height:
                  _getRandomHeight(context), // Random height for the grid item
            ),
          ),
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          // Text Overlay
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: _getCardTitleFontSize(context),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    fontSize: _getCardSubtitleFontSize(context),
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          // Hover Effect for Documentation Link
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: () => _launchURL(item.documentationUrl),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.4),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.link,
                      size: _getButtonIconSize(context),
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) {
    // Replace with actual URL launcher logic for web or mobile
    print('Launching URL: $url');
  }

  // Constants for random heights to create the unaligned layout
  double _getRandomHeight(BuildContext context) {
    if (Responsive.isMobile(context)) return _getRandomHeightValue(150, 250);
    if (Responsive.isTablet(context)) return _getRandomHeightValue(200, 300);
    return _getRandomHeightValue(250, 350); // Desktop
  }

  double _getRandomHeightValue(double min, double max) {
    return min +
        (max - min) * (new DateTime.now().millisecondsSinceEpoch % 100) / 100.0;
  }

  // Grid cross axis count based on screen size
  int _getCrossAxisCount(BuildContext context) {
    if (Responsive.isMobile(context)) return 2;
    if (Responsive.isTablet(context)) return 3;
    return 4; // Desktop
  }

  // Constants for title icon size
  double _getTitleIconSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 20.0;
    if (Responsive.isTablet(context)) return 28.0;
    return 36.0; // Desktop
  }

  // Constants for title font size
  double _getTitleFontSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 20.0;
    if (Responsive.isTablet(context)) return 28.0;
    return 36.0; // Desktop
  }

  // Constants for card title font size
  double _getCardTitleFontSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 16.0;
    if (Responsive.isTablet(context)) return 18.0;
    return 22.0; // Desktop
  }

  // Constants for card subtitle font size
  double _getCardSubtitleFontSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 14.0;
    if (Responsive.isTablet(context)) return 16.0;
    return 18.0; // Desktop
  }

  // Constants for button icon size
  double _getButtonIconSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 40.0;
    if (Responsive.isTablet(context)) return 50.0;
    return 60.0; // Desktop
  }
}
