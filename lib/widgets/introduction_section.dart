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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi, I'm Nainaiu Rakhaine",
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            fontFamily:
                'FontAwesome', // Example: Use FontAwesome for custom fonts
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "As a passionate and driven Electrical and Electronic Engineering student, I specialize in embedded systems and IoT. With hands-on experience in microcontroller programming, PCB design, and TinyML, I have developed a strong foundation in both hardware and software integration. My journey includes leading projects that harness the power of IoT to solve real-world problems, as well as achieving recognition in national and international competitions. My work reflects a blend of technical expertise and innovation, always pushing the boundaries of what’s possible in the world of electronics and embedded systems.",
          style: TextStyle(
            fontSize: bodyFontSize,
            color: Colors.white70,
            fontFamily:
                'FontAwesome', // Example: Use FontAwesome for custom fonts
          ),
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
            "Learn More",
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
