import 'package:flutter/material.dart';
import '../utils/responsive.dart'; // Import your responsive helper file

class IntroductionSection extends StatelessWidget {
  @override
  final Key key;

  const IntroductionSection({required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          vertical: 50, horizontal: 20), // Added horizontal padding
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
    String aboutMeText =
        '''An Electrical and Electronic Engineering student passionate about embedded systems and IoT. With hands-on experience in microcontroller programming, PCB design, and TinyML, I love turning ideas into practical solutions.\n\nI've led projects ranging from autonomous underwater vehicles to smart communication devices, and I've earned recognition in national and international competitions for my innovative work. My journey is fueled by a curiosity for technology and a drive to tackle complex challenges. \n\nBeyond academics, I enjoy exploring new tech trends, learning programming languages, and collaborating on exciting projects. I'm always eager to take on new challenges and grow as an engineer.\n\nThanks for stopping by my portfolio—I look forward to connecting with you!''';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aboutMeTtile,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontFamily:
                'FontAwesome', // Example: Use FontAwesome for custom fonts
          ),
        ),
        const SizedBox(height: 20),
        Text(aboutMeText,
            style: TextStyle(
              fontSize: bodyFontSize,
              color: Colors.white70,
              fontFamily:
                  'FontAwesome', // Example: Use FontAwesome for custom fonts
            ),
            textAlign: TextAlign.justify),
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
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
        ),
      ],
    );
  }
}
