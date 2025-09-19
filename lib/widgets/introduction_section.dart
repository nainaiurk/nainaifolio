import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class IntroductionSection extends StatelessWidget {
  @override
  final Key key;

  const IntroductionSection({required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).cardColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Responsive(
        mobile: _buildContent(context, 28, 14),
        tablet: _buildContent(context, 32, 16),
        desktop: _buildContent(context, 36, 18),
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, double titleFontSize, double bodyFontSize) {
    const String aboutMeTtile = "Hi, I'm Nainaiu Rakhaine,";
    const String aboutMeText =
        '''A dedicated Electrical and Electronic Engineering graduate from Shahjalal University of Science and Technology, Sylhet, with a strong foundation in embedded systems, IoT technologies, and autonomous systems. Currently pursuing advanced research in autonomous vehicles and intelligent sensing platforms, I combine academic excellence with practical engineering experience.\n\nMy expertise spans embedded systems, IoT development, autonomous vehicle technology, and technical communication. I've successfully deployed multiple IoT solutions including biometric attendance systems and environmental monitoring networks, while contributing to Bangladesh's first Level 2 autonomous vehicle initiative.\n\nWith proficiency in Python, Flutter, microcontroller programming, and PCB design, I bridge the gap between hardware and software domains. My work demonstrates versatility across TinyML implementations, RTOS-based systems, and modern mobile development frameworks.\n\nI'm passionate about turning innovative ideas into practical engineering solutions and always eager to tackle complex challenges that push technological boundaries.\n\nResearch interests include: wearable sensing systems, ultra-low-power IoT devices, and TinyML-powered embedded intelligence for health, environment, and mobility applications.''';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aboutMeTtile,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontFamily: 'FontAwesome',
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 20),
        Text(
          aboutMeText,
          style: TextStyle(
            fontSize: bodyFontSize,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontFamily: 'FontAwesome',
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            // Scroll to About Me section
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            side: BorderSide(color: Theme.of(context).primaryColor),
          ),
          child: Text(
            "Learn More Below",
            style: TextStyle(
              fontSize: bodyFontSize - 3,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimary, // Use onPrimary for button text contrast
            ),
          ),
        ),
      ],
    );
  }
}
