import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nainaifolio/utils/constant.dart';

class AnimatedHeader extends StatelessWidget {
  const AnimatedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: getMaxHeight(context), // Set a fixed height for the header
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              top: getMaxHeight(context) * 0.15,
              left: -getMaxWidth(context) * 0.06,
              child: Image(
                image: const AssetImage('images/me.png'),
                fit: BoxFit.contain,
                height: getMaxHeight(context) * 0.85,
                width: getMaxWidth(context) * 0.5,
              )),
          Positioned(
              top: getMaxHeight(context) * 0.4,
              right: getMaxWidth(context) * 0.1,
              child: Container(
                height: getMaxHeight(context) * 0.5,
                width: getMaxWidth(context) * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello:)\nWelcome to Nainai's Portfolio",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                    Text(
                      "NAINAIU\nRAKHAINE",
                      style: TextStyle(
                        fontSize: 50,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.facebook),
                          color: Theme.of(context).primaryColor,
                          iconSize: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.linkedin),
                          color: Theme.of(context).primaryColor,
                          iconSize: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.twitter),
                          color: Theme.of(context).primaryColor,
                          iconSize: 50,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.github),
                          color: Theme.of(context).primaryColor,
                          iconSize: 50,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
