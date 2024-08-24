import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/offer_item.dart';

class WhatICanOfferSection extends StatelessWidget {
  final Key? key;
  final List<OfferItem> offers = [
    OfferItem(
      icon: FontAwesomeIcons.mobileScreenButton,
      label: "App Development",
      color: Colors.blueAccent,
    ),
    OfferItem(
      icon: FontAwesomeIcons.microchip,
      label: "PCB Design",
      color: Colors.greenAccent,
    ),
    OfferItem(
      icon: FontAwesomeIcons.satelliteDish,
      label: "IoT Projects",
      color: Colors.orangeAccent,
    ),
    OfferItem(
      icon: FontAwesomeIcons.screwdriverWrench,
      label: "Electronics",
      color: Colors.redAccent,
    ),
  ];

  WhatICanOfferSection({required this.key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60.0),
      // color: Theme.of(context).cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Section Heading
          Text(
            "What I Can Offer?",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 30),
          // Circular Layout for Offerings
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 30.0,
            runSpacing: 30.0,
            children:
                offers.map((offer) => _buildOfferItem(context, offer)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildOfferItem(BuildContext context, OfferItem offer) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: offer.color.withOpacity(0.2),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: offer.color.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
            child: FaIcon(
              offer.icon,
              size: 40,
              color: offer.color,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          offer.label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
      ],
    );
  }
}
