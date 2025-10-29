// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/link_style.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../models/project_item.dart';
import '../utils/responsive.dart';

class ProjectsSection extends StatelessWidget {
  final Key? key;

  ProjectsSection({this.key}) : super(key: key);

  // Title font is computed per-build for responsive sizing (mobile/tablet reduced)

  final List<ProjectItem> projectList = [
    ProjectItem(
      title: 'Microcontroller Board Design',
      subtitle: 'Custom PCB for Embedded Systems',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZLJ4FenmNw7xBQ2KcebhDvJ7IKtYkqLz',
      videoUrl: 'https://youtu.be/jr4CWijJ-Eg',
      images: [
        'https://via.placeholder.com/800x400.png?text=PCB+1',
        'https://via.placeholder.com/800x400.png?text=PCB+2',
      ],
      description:
          'Designed a compact microcontroller development board optimized for low-power IoT nodes. Features USB-C power, multiple sensor headers, and an onboard LiPo charger.',
      achievements: [
        'Designed for University Embedded System Lab',
        'Now Used in Research Projects by Students',
        'Validated power sequencing and bootloader'
      ],
      contest: null,
    ),
    ProjectItem(
      title: 'PCB Drones',
      subtitle: 'Design and Development of Drones',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZGET_Cgg8Q7w8fFHS2KSjtu5pL10Ac0n',
      documentationUrl: 'https://oshwlab.com/nainaiu.rakhaine/mini-cam-drone',
      description:
          'Built a custom PCB drone around an ESP32-S3 and camera for low-latency video streaming and remote monitoring. Focused on lightweight design, reliable telemetry and low-latency video pipeline.',
      achievements: [
        'Featured as Star Project of the Open Source Hardware Lab (OSHWLAB)',
        'Open-sourced flight controller schematics'
      ],
      contest: null,
    ),
    ProjectItem(
      title: 'AUV (Autonomous Underwater Vehicle)',
      subtitle: 'Design of Autonomous Underwater Vehicles',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZO5brHNF0UImesYNftWbbe93ArYloDRd',
      documentationUrl:
          'https://github.com/Ad-Deen/AUV-project-Electrical-stack',
      images: [
        'https://via.placeholder.com/800x400.png?text=ORCA+AUV+1',
      ],
      description:
          'Led embedded systems design for the ORCA Autonomous Underwater Vehicle (AUV), focusing on underwater sensor integration, real-time communication, and control algorithms. Worked on power distribution, depth-rated electronics, and acoustic modem integration.',
      achievements: [
        'Selected for the Singapore AUV Challenge (SAUVC 2025), representing Bangladesh among 25+ countries',
        'Designed depth-rated control electronics and integrated acoustic positioning',
      ],
      otherLinks: ['https://github.com/Ad-Deen/AUV-project-Electrical-stack'],
      contest: 'SAUVC 2025',
    ),
    ProjectItem(
      title: 'Autonomous Electric Vehicle',
      subtitle: 'Autonomous Electric Vehicle Development',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZRRegB9bHrYeZ_4QCu-v5Z_VncM6FFRD',
      documentationUrl: 'https://www.youtube.com/watch?v=2jCTuZDS7PI',
      images: ['https://via.placeholder.com/800x400.png?text=EV+1'],
      description:
          'Worked on battery management system (BMS) and motor controller integration for a lightweight electric vehicle prototype.',
      achievements: [
        'Designed BMS for 48V pack',
        'Implemented regenerative braking control'
      ],
      otherLinks: ['https://example.com/ev/repo'],
    ),
    ProjectItem(
      title: 'Line Follower Robot',
      subtitle: 'Robotics and Automation',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZT-vIBzM1FTTGnj39H1K6vuZ2wINaXLs',
      documentationUrl: 'https://oshwlab.com/nainaiu.rakhaine/lfr_pcb',
      images: [
        'https://via.placeholder.com/800x400.png?text=Advanced+Line+Follower+1'
      ],
      description:
          'Advanced Line Follower Robot with multi-modal operation, PID-based high-speed line following and maze navigation. Includes an interactive display for on-the-fly mode selection and telemetry.',
      achievements: [
        'Developed high-speed PID control and maze navigation modes',
        'Interactive mode selection UI for runtime tuning'
      ],
      otherLinks: ['https://github.com/nainaiurk/InfiniteBot.git'],
    ),
    ProjectItem(
      title: 'LoRa Messenger',
      subtitle: 'Long Range Communication Project',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1ZNiOikXJjXsQHgfMWLwObXjfePd-1bqE',
      documentationUrl: 'https://github.com/nainaiurk/LoRa-Messenger',
      images: ['https://via.placeholder.com/800x400.png?text=LoRa+Messenger+1'],
      description:
          'Implemented a secure long-range LoRa messaging device with a custom antenna, reaching nearly 5 km in field trials. Emphasized low cost and long battery life for remote IoT deployments.',
      achievements: [
        'Achieved nearly 5 km range with custom antenna',
        'Low-power firmware achieving 30+ day battery life'
      ],
      otherLinks: ['https://github.com/nainaiurk/LoRa-Messenger'],
    ),
    ProjectItem(
      title: 'Chat App',
      subtitle: 'Flutter-based Chat Application',
      imageUrl: '',
      // documentationUrl: 'https://example.com/docs/chat-app',
      description:
          'A secure chat client built with Flutter supporting real-time messaging, media sharing, and end-to-end encryption.',
      achievements: [
        'Implemented realtime syncing and media upload',
        'End-to-end encryption using libsodium'
      ],
      // otherLinks: ['https://example.com/chat-app/repo'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final titleFont = isMobile ? 18.0 : (isTablet ? 22.0 : 28.0);
    final headingStyle = theme.textTheme.headlineSmall?.copyWith(
      fontSize: titleFont,
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
            'Selected technical projects showcasing expertise in Embedded Systems, Robotics, IoT communications, and embedded intelligence. These projects include international competition entries, open-source hardware designs, and innovative IoT solutions. Click on any project to explore the GitHub repositories and detailed documentation.',
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
    final theme = Theme.of(context);

    return InkWell(
      onTap: () => _showProjectDetails(context, item),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.secondary.withOpacity(0.5),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: item.imageUrl.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: _getRandomHeight(context),
                      placeholder: (context, url) => Container(
                        width: double.infinity,
                        height: _getRandomHeight(context),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                      errorWidget: (context, url, error) {
                        debugPrint('Failed to load image: ${item.imageUrl}');
                        return _buildProjectIconPlaceholder(item, context);
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
                  onTap: () => _showProjectDetails(context, item),
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
      ),
    );
  }

  void _showProjectDetails(BuildContext context, ProjectItem item) {
    showDialog(
      context: context,
      builder: (ctx) {
        final theme = Theme.of(ctx);
        final bool isMobileDialog = MediaQuery.of(ctx).size.width < 700;
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 800, maxHeight: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // Compute dialog breakpoint once
              // (cannot declare variables inside the children list)

              children: [
                // Header with title and close
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(item.title,
                            style: theme.textTheme.headlineSmall),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(ctx).pop(),
                      )
                    ],
                  ),
                ),
                const Divider(height: 1),
                // Image carousel or placeholder (use contain + InteractiveViewer on larger screens only)
                if ((item.images ?? []).isNotEmpty)
                  SizedBox(
                    height: 220,
                    child: PageView(
                      children: item.images!
                          .map((src) => src.isNotEmpty
                              ? RepaintBoundary(
                                  child: isMobileDialog
                                      ? CachedNetworkImage(
                                          imageUrl: src,
                                          fit: BoxFit.contain,
                                          errorWidget: (c, u, e) {
                                            debugPrint(
                                                'Failed to load carousel image: $src');
                                            return const SizedBox();
                                          },
                                          placeholder: (c, u) => const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        )
                                      : InteractiveViewer(
                                          child: CachedNetworkImage(
                                            imageUrl: src,
                                            fit: BoxFit.contain,
                                            errorWidget: (c, u, e) {
                                              debugPrint(
                                                  'Failed to load carousel image: $src');
                                              return const SizedBox();
                                            },
                                            placeholder: (c, u) => const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                          ),
                                        ),
                                )
                              : const SizedBox())
                          .toList(),
                    ),
                  )
                else
                  SizedBox(
                    height: 180,
                    child: item.imageUrl.isNotEmpty
                        ? RepaintBoundary(
                            child: isMobileDialog
                                ? CachedNetworkImage(
                                    imageUrl: item.imageUrl,
                                    fit: BoxFit.contain,
                                    errorWidget: (c, u, e) {
                                      debugPrint(
                                          'Failed to load dialog image: ${item.imageUrl}');
                                      return Center(
                                        child: Icon(_getProjectIcon(item.title),
                                            size: 72,
                                            color: theme.colorScheme.primary),
                                      );
                                    },
                                    placeholder: (c, u) => const Center(
                                        child: CircularProgressIndicator()),
                                  )
                                : InteractiveViewer(
                                    child: CachedNetworkImage(
                                      imageUrl: item.imageUrl,
                                      fit: BoxFit.contain,
                                      errorWidget: (c, u, e) {
                                        debugPrint(
                                            'Failed to load dialog image: ${item.imageUrl}');
                                        return Center(
                                          child: Icon(
                                              _getProjectIcon(item.title),
                                              size: 72,
                                              color: theme.colorScheme.primary),
                                        );
                                      },
                                      placeholder: (c, u) => const Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                  ),
                          )
                        : Center(
                            child: Icon(
                              _getProjectIcon(item.title),
                              size: 72,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                  ),
                // Details and links
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.subtitle, style: theme.textTheme.bodyLarge),
                          const SizedBox(height: 12),
                          if (item.contest != null) ...[
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(
                                color:
                                    theme.colorScheme.primary.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text('Contest: ${item.contest}',
                                  style: theme.textTheme.bodySmall),
                            ),
                            const SizedBox(height: 12),
                          ],
                          if (item.description != null) ...[
                            Text(item.description!,
                                style: theme.textTheme.bodyMedium),
                            const SizedBox(height: 12),
                          ],
                          if ((item.achievements ?? []).isNotEmpty) ...[
                            Text('Achievements',
                                style: theme.textTheme.titleSmall),
                            const SizedBox(height: 8),
                            ...item.achievements!.map((a) => Padding(
                                  padding: const EdgeInsets.only(bottom: 6.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('• ',
                                          style: TextStyle(fontSize: 18)),
                                      Expanded(child: Text(a)),
                                    ],
                                  ),
                                )),
                            const SizedBox(height: 12),
                          ],
                          if (item.documentationUrl != null)
                            Row(children: [
                              const Icon(Icons.description, size: 18),
                              const SizedBox(width: 8),
                              Hyperlink('Documentation',
                                  onTap: () =>
                                      _launchURL(item.documentationUrl!),
                                  style: linkTextStyle(context)),
                            ]),
                          if (item.videoUrl != null)
                            Row(children: [
                              const Icon(Icons.play_circle_fill, size: 18),
                              const SizedBox(width: 8),
                              Hyperlink('Video',
                                  onTap: () => _launchURL(item.videoUrl!),
                                  style: linkTextStyle(context)),
                            ]),
                          if ((item.otherLinks ?? []).isNotEmpty)
                            ...item.otherLinks!.map((l) => Row(children: [
                                  const Icon(Icons.link, size: 16),
                                  const SizedBox(width: 8),
                                  Hyperlink(l,
                                      onTap: () => _launchURL(l),
                                      style: linkTextStyle(context)),
                                ])),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _launchURL(String? url) async {
    if (url == null || url.isEmpty) return;
    debugPrint('Launching URL: $url');
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  double _getRandomHeight(BuildContext context) {
    if (Responsive.isMobile(context)) return _getRandomHeightValue(160, 200);
    if (Responsive.isTablet(context)) return _getRandomHeightValue(220, 280);
    return _getRandomHeightValue(300, 360);
  }

  double _getRandomHeightValue(double min, double max) {
    return min +
        (max - min) * (DateTime.now().millisecondsSinceEpoch % 100) / 100.0;
  }

  int _getCrossAxisCount(BuildContext context) {
    // allow two columns on narrow/mobile screens for denser layout
    if (Responsive.isMobile(context)) return 2;
    if (Responsive.isTablet(context)) return 2;
    return 3;
  }

  double _getCardTitleFontSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 14.0;
    if (Responsive.isTablet(context)) return 20.0;
    return 22.0;
  }

  double _getCardSubtitleFontSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 13.0;
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
