// widgets/publications_section.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/publication_item.dart';

class PublicationsSection extends StatelessWidget {
  final Key? key;

  PublicationsSection({this.key}) : super(key: key);

  final List<PublicationItem> publicationsList = [
    PublicationItem(
      title:
          'A Comprehensive Android App Based Solution for Automated Attendance and Management in Institutions Using IoT and TinyML',
      year: 2023,
      type: 'Conference Paper',
      doi: 'https://doi.org/10.1109/ICICT4SD59951.2023.10303506',
      abstract:
          'The Internet of Things (IoT) has emerged as a revolutionary technology, transforming the way we interact with our surroundings and enabling a new era of connectivity. The idea of IoT has led to numerous applications across numerous domains. In the educational sector, however, IoT is still working out its challenges and concerns. Hardware expenses, software implementations, security issues, management complications, and various other challenges are pulling backward the implementation of IoT in the educational sector. This project paper introduces an effective solution model that combines the ESP-32 CAM microcontroller to reduce the expense, face recognition algorithms, the Edge Impulse platform, and TinyML in the process of smart attendance system. Furthermore, this project incorporates the Flutter framework for mobile app development, providing a comprehensive medium for a seamless user experience. This medium can increase the efficiency and engagement of the students by automating some administrative activities and offers a fun way to educate pupils.',
    ),
    PublicationItem(
      title:
          'Revolution in Campus Transportation: The Autonomous Electric Vehicle With Smart Features',
      year: 2023,
      type: 'Conference Paper',
      doi: 'https://doi.org/10.1109/ICPS60393.2023.10429029',
      abstract:
          'This paper introduces the Autonomous Electric Vehicle with RFID Card, a ground-breaking four-wheeled vehicle meant to transform campus transportation. Through sophisticated technology and environmentally sensitive engineering, this unique vehicle embodies the confluence of autonomy, sustainability, and passenger convenience. The system design incorporates an Arduino module, RFID card technology for exact student identification, sonar sensors for obstacle avoidance, and now, a GPS tracking device for expanded functionality. The vehicle’s engine features a BLDC motor controller, a 48-volt DC battery, and a 200 W solar panel for efficient and sustainable running. Its sturdy physical design includes a unique body composed of steel and iron, as well as a solar panel that charges the vehicle’s batteries. Precise steering, powered by a 300 KG ASME digital servo motor, assures passenger safety and comfort. Passengers may not only enjoy smooth RFID card-based identification but also trace their travel in real time with the inclusion of a GPS tracking device. This Autonomous Electric Vehicle promises to revolutionize campus mobility by providing excellent speed, efficiency, obstacle avoidance capabilities, and now accurate GPS-based monitoring for an all-encompassing transportation solution.',
    ),
    PublicationItem(
      title:
          'A Comparative Analysis of Power Consumption and Security Features in LoRa and LoRaWAN Messaging Devices',
      year: 2021,
      type: 'Conference Paper',
      doi: 'https://doi.org/10.1109/ICAEEE62219.2024.10561782',
      abstract:
          'In the evolving landscape of the Internet of Things (IoT), the quest for reliable and efficient communication in remote and underserved regions remains a formidable challenge. This research investigates the transformative potential of Long Range (LoRa) technology, specifically within the LoRaWAN framework, to enhance rural connectivity through an innovative messaging system. Emphasizing the imperative of securing data transmission, the proposed system exclusively integrates the Advanced Encryption Standard (AES) to fortify communication channels. This study systematically explores the multifaceted impact of AES encryption on computational efficiency and power consumption. A distinguishing feature lies in the device’s seamless transition between encryption modes, ensuring optimal performance across varying communication scenarios. The elucidated system architecture details the end-to-end process of message composition, transmission, and reception. The implementation phase comprehensively covers hardware specifications, software intricacies, and the seamless integration of LoRaWAN security measures. The messaging flow, from user input to transmission, exemplifies the device’s efficacy in real-world scenarios. Additionally, this research introduces a novel comparative power consumption analysis. By scrutinizing the device’s behavior under diverse communication scenarios, including the nuanced power consumption implications of switching between encryption modes, the study provides valuable insights for practitioners into the energy efficiency of communication.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            children: [
              const Icon(FontAwesomeIcons.bookJournalWhills, size: 40),
              const SizedBox(width: 20),
              Text(
                "Publications",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Publications List
          Column(
            children: publicationsList.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _buildPublicationCard(item, context),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPublicationCard(PublicationItem item, BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: Colors.black45,
      color: Theme.of(context).cardColor.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PublicationCardContent(item: item),
      ),
    );
  }
}

class PublicationCardContent extends StatefulWidget {
  final PublicationItem item;

  const PublicationCardContent({super.key, required this.item});

  @override
  _PublicationCardContentState createState() => _PublicationCardContentState();
}

class _PublicationCardContentState extends State<PublicationCardContent> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Publication Title
        Text(
          widget.item.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        const SizedBox(height: 8),
        // Publication Details (Year, Type, DOI)
        Row(
          children: [
            Icon(
              FontAwesomeIcons.calendarAlt,
              size: 16,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
            const SizedBox(width: 5),
            Text(
              widget.item.year.toString(),
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodySmall!.color),
            ),
            const SizedBox(width: 15),
            Icon(
              FontAwesomeIcons.fileAlt,
              size: 16,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
            const SizedBox(width: 5),
            Text(
              widget.item.type,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodySmall!.color),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // DOI Link
        Row(
          children: [
            Icon(
              FontAwesomeIcons.link,
              size: 16,
              color: Theme.of(context).textTheme.bodySmall!.color,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: InkWell(
                onTap: () {
                  // Handle DOI link tap
                  _launchURL(widget.item.doi);
                },
                child: Text(
                  widget.item.doi,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
        // const SizedBox(height: 12),
        // Abstract Text
        AnimatedCrossFade(
          firstChild: Container(),
          secondChild: Column(
            children: [
              Text(
                'Abstract',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
              Text(
                widget.item.abstract,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
            ],
          ),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
        // const SizedBox(height: 8),
        // Expand/Collapse Button
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(isExpanded ? 'Show Less' : 'Show More',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                )),
          ),
        ),
      ],
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
