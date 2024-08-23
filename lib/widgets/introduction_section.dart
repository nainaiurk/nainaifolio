import 'package:flutter/material.dart';
import 'package:nainaifolio/utils/constant.dart';

class IntroductionSection extends StatelessWidget {
  @override
  final Key key;

  const IntroductionSection({required this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxHeight = getMaxHeight(context);
    double maxWidth = getMaxWidth(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: maxWidth * 0),
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
            "I am a Software Developer with expertise in Flutter, Dart, and Web Development. I have a passion for creating elegant and efficient software solutions.",
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
