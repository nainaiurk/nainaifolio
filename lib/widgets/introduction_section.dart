import 'package:flutter/material.dart';

class IntroductionSection extends StatelessWidget {
  @override
  final Key key;

  const IntroductionSection({required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).scaffoldBackgroundColor,
            Theme.of(context).cardColor,
            // Theme.of(context).canvasColor,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hi, I'm Nainaiu Rakhaine",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "As a passionate and driven Electrical and Electronic Engineering student, I specialize in embedded systems and IoT. With hands-on experience in microcontroller programming, PCB design, and TinyML, I have developed a strong foundation in both hardware and software integration. My journey includes leading projects that harness the power of IoT to solve real-world problems, as well as achieving recognition in national and international competitions. My work reflects a blend of technical expertise and innovation, always pushing the boundaries of what\’s possible in the world of electronics and embedded systems.",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
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
                  fontSize: 15,
                  color: Theme.of(context).textTheme.bodyMedium!.color),
            ),
          ),
        ],
      ),
    );
  }
}
