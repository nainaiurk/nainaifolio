import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/experience_item.dart';
import '../utils/responsive.dart';

class ExperienceSection extends StatelessWidget {
  final Key? key;

  ExperienceSection({this.key}) : super(key: key);

  final List<ExperienceItem> experienceList = [
    ExperienceItem(
      title: 'Robonix Mechnovation 2022',
      description: 'Secured 2nd place in Line Follower Robot Contest.',
      type: 'Achievement',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1VGx1PaYbVE2SbtOX2xAmT1_lNcz-zUGX',
    ),
    ExperienceItem(
      title: 'JRC Board Hackathon 2023',
      description:
          'Led a team to victory in the JRC Board Hackathon on The Topic "IoT for Industries".',
      type: 'Achievement',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1VQQ0TsFdYC3RF_0D8B1G0jAn9il1F5Vq',
    ),
    ExperienceItem(
      title: 'University Innovation Hub Program 2024',
      description:
          'Secured Top 5 position in the University Innovation Hub Program for The Startup Idea on \'Autonomous Underwater Vehicle\'.',
      type: 'Achievement',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1VDerRfKn2Lv_-EjJHWTQApeAVrFQueO4',
    ),
    ExperienceItem(
      title: 'NASA Space Apps Challenge 2022',
      description:
          'Participated in the NASA Space Apps Challenge National Round.',
      type: 'Contest Participation',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1VQkBgnl5lI9GAtoTQ2O8t_xxSDyP6E6-',
    ),
    ExperienceItem(
      title: 'President In RoboSUST',
      description:
          'Volunteered in a Robotics Club of SUST as a President.(2024-2025)',
      type: 'Volunteer',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1VTBrEfHNxy1IN8fc-WzZlPGkowg-fZmp',
    ),
    ExperienceItem(
      title: 'Junior App Developer',
      description:
          'Worked as a Junior App Developer in a Software Company.(2021-2022)',
      type: 'Job',
      imageUrl:
          'https://lh3.googleusercontent.com/d/1VTBrEfHNxy1IN8fc-WzZlPGkowg-fZmp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const minCardWidth = 250.0; // Constant minimum width for each card
    const maxCardWidth = 300.0; // Maximum width for each card

    // Calculate the number of cards per row
    int cardsPerRow = (screenWidth / (minCardWidth + 16)).floor();
    cardsPerRow =
        cardsPerRow < 2 ? 2 : cardsPerRow; // Ensure at least 2 cards per row

    final cardWidth = (screenWidth - (cardsPerRow - 1) * 16) / cardsPerRow;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(FontAwesomeIcons.award,
                  size: TitleIconSize().titleIconSize(context)),
              const SizedBox(width: 20),
              Text(
                "Experience & Achievements",
                style: TextStyle(
                  fontSize: TitleFontSize().titleFontSize(context),
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 16.0, // Spacing between cards horizontally
            runSpacing: 16.0, // Spacing between cards vertically
            children: experienceList.map((item) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: minCardWidth,
                  maxWidth: cardWidth.clamp(minCardWidth, maxCardWidth),
                ),
                child: _buildExperienceCard(item, context),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(ExperienceItem item, BuildContext context) {
    bool isExpanded = false;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          shadowColor: Colors.black45,
          color: Theme.of(context).cardColor,
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: isExpanded ? 250 : 200,
                    ),
                  ),
                  if (!isExpanded)
                    Positioned.fill(
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.8),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item.description,
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                    });
                                  },
                                  child: Text(
                                    'Read More',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              if (isExpanded)
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Theme.of(context).cardColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).textTheme.bodySmall!.color,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Text(
                                'Read Less',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
