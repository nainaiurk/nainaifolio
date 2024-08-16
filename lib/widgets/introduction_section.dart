import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class IntroductionSection extends StatelessWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Responsive(
        mobile: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hi, I'm John Doe",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "I am a Software Developer with expertise in Flutter, Dart, and Web Development.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Scroll to About Me section
              },
              child: const Text("Learn More"),
            ),
          ],
        ),
        tablet: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, I'm John Doe",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "I am a Software Developer with expertise in Flutter, Dart, and Web Development.",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Scroll to About Me section
              },
              child: const Text("Learn More"),
            ),
          ],
        ),
        desktop: Row(
          children: [
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, I'm John Doe",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "I am a Software Developer with expertise in Flutter, Dart, and Web Development.",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Scroll to About Me section
              },
              child: const Text("Learn More"),
            ),
          ],
        ),
      ),
    );
  }
}
