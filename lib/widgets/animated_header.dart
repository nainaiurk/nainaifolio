// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nainaifolio/utils/constant.dart';
import 'dart:js' as js;

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
                image: const AssetImage('assets/images/me.png'),
                fit: BoxFit.contain,
                height: getMaxHeight(context) * 0.85,
                width: getMaxWidth(context) * 0.5,
              )),
          Positioned(
              top: getMaxHeight(context) * 0.4,
              right: getMaxWidth(context) * 0.1,
              child: Container(
                color: Colors.transparent,
                height: getMaxHeight(context) * 0.5,
                width: getMaxWidth(context) * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello:)",
                      style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Welcome to Nainai's Portfolio",
                          textStyle: const TextStyle(
                            fontSize: 25,
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 4,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
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
                          onPressed: () {
                            _launchURL(
                                'https://www.facebook.com/nainaiu.rk1234/');
                          },
                          icon: const Icon(FontAwesomeIcons.facebook),
                          color: Theme.of(context).primaryColor,
                          iconSize: 50,
                        ),
                        IconButton(
                          onPressed: () {
                            _launchURL(
                                'https://www.linkedin.com/in/nainaiu-rakhaine');
                          },
                          icon: const Icon(FontAwesomeIcons.linkedin),
                          color: Theme.of(context).primaryColor,
                          iconSize: 50,
                        ),
                        IconButton(
                          onPressed: () {
                            _launchURL(
                                'https://www.linkedin.com/in/nainaiu-rakhaine');
                          },
                          icon: const Icon(FontAwesomeIcons.twitter),
                          color: Theme.of(context).primaryColor,
                          iconSize: 50,
                        ),
                        IconButton(
                          onPressed: () {
                            _launchURL('https://github.com/nainaiurk');
                          },
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

  void _launchURL(String url) {
    js.context.callMethod('open', [url]);
  }
}
