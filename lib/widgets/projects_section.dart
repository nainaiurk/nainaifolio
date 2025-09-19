// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/project_item.dart';
import '../utils/responsive.dart';

class ProjectsSection extends StatelessWidget {
  final Key? key;

  ProjectsSection({this.key}) : super(key: key);

  static const double _titleFontSize = 28;

  final List<ProjectItem> projectList = [
    ProjectItem(
      title: 'Microcontroller Board Design',
      subtitle: 'Custom PCB for Embedded Systems',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZLJ4FenmNw7xBQ2KcebhDvJ7IKtYkqLz',
      documentationUrl: 'https://example.com/docs/microcontroller-board',
    ),
    ProjectItem(
      title: 'PCB Drones',
      subtitle: 'Design and Development of Drones',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZGET_Cgg8Q7w8fFHS2KSjtu5pL10Ac0n',
      documentationUrl: 'https://example.com/docs/pcb-drones',
    ),
    ProjectItem(
      title: 'AUV (Autonomous Underwater Vehicle)',
      subtitle: 'Design of Autonomous Underwater Vehicles',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZO5brHNF0UImesYNftWbbe93ArYloDRd',
      documentationUrl: 'https://example.com/docs/auv',
    ),
    ProjectItem(
      title: 'Electric Vehicle',
      subtitle: 'Electric Car Development',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZRRegB9bHrYeZ_4QCu-v5Z_VncM6FFRD',
      documentationUrl: 'https://example.com/docs/electric-vehicle',
    ),
    ProjectItem(
      title: 'Line Follower Robot',
      subtitle: 'Robotics and Automation',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZT-vIBzM1FTTGnj39H1K6vuZ2wINaXLs',
      documentationUrl: 'https://example.com/docs/line-follower-robot',
    ),
    ProjectItem(
      title: 'LoRa Messenger',
      subtitle: 'Long Range Communication Project',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZNiOikXJjXsQHgfMWLwObXjfePd-1bqE',
      documentationUrl: 'https://example.com/docs/lora-messenger',
    ),
    ProjectItem(
      title: 'Chat App',
      subtitle: 'Flutter-based Chat Application',
      imageUrl: '',
      documentationUrl: 'https://example.com/docs/chat-app',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final headingStyle = theme.textTheme.headlineSmall?.copyWith(
      fontSize: _titleFontSize,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.6,
      color: theme.colorScheme.primary,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                FontAwesomeIcons.diagramProject,
                size: 24,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 16),
              Text('Projects', style: headingStyle),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${projectList.length}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Selected technical projects showcasing expertise in autonomous systems, IoT communications, and embedded intelligence. These projects include international competition entries, open-source hardware designs, and innovative IoT solutions. Click on any project to explore the GitHub repositories and detailed documentation.',
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: theme.textTheme.bodyMedium?.color?.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 32),
          _buildStaggeredGridView(context),
        ],
      ),
    );
  }

  Widget _buildStaggeredGridView(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: _getCrossAxisCount(context),
      mainAxisSpacing: 24.0,
      crossAxisSpacing: 24.0,
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
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: item.imageUrl.isNotEmpty
                ? Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: _getRandomHeight(context),
                    errorBuilder: (context, error, stackTrace) {
                      debugPrint('Failed to load image: ${item.imageUrl}');
                      return _buildProjectIconPlaceholder(item, context);
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Container(
                          width: double.infinity,
                          height: _getRandomHeight(context),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  )
                : _buildProjectIconPlaceholder(item, context),
          ),
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
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
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
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    debugPrint('Launching URL: $url');
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
      // Show a snackbar or dialog to inform the user
      // This would require access to BuildContext, so we'll handle it differently
    }
  }

  double _getRandomHeight(BuildContext context) {
    if (Responsive.isMobile(context)) return _getRandomHeightValue(220, 260);
    if (Responsive.isTablet(context)) return _getRandomHeightValue(260, 320);
    return _getRandomHeightValue(300, 360);
  }

  double _getRandomHeightValue(double min, double max) {
    return min +
        (max - min) * (DateTime.now().millisecondsSinceEpoch % 100) / 100.0;
  }

  int _getCrossAxisCount(BuildContext context) {
    if (Responsive.isMobile(context)) return 1;
    if (Responsive.isTablet(context)) return 2;
    return 3;
  }

  double _getCardTitleFontSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 18.0;
    if (Responsive.isTablet(context)) return 20.0;
    return 22.0;
  }

  double _getCardSubtitleFontSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 14.0;
    if (Responsive.isTablet(context)) return 16.0;
    return 18.0;
  }

  double _getButtonIconSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 36.0;
    if (Responsive.isTablet(context)) return 44.0;
    return 48.0;
  }

  IconData _getProjectIcon(String title) {
    switch (title.toLowerCase()) {
      case 'microcontroller board design':
        return FontAwesomeIcons.microchip;
      case 'pcb drones':
        return FontAwesomeIcons.plane;
      case 'auv (autonomous underwater vehicle)':
        return FontAwesomeIcons.water;
      case 'electric vehicle':
        return FontAwesomeIcons.car;
      case 'line follower robot':
        return FontAwesomeIcons.robot;
      case 'lora messenger':
        return FontAwesomeIcons.broadcastTower;
      case 'chat app':
        return FontAwesomeIcons.comments;
      default:
        return FontAwesomeIcons.projectDiagram;
    }
  }

  Widget _buildProjectIconPlaceholder(ProjectItem item, BuildContext context) {
    return Container(
      width: double.infinity,
      height: _getRandomHeight(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.1),
            Theme.of(context).colorScheme.primary.withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          width: 1.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getProjectIcon(item.title),
              size: 48,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              item.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              item.subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.7),
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
