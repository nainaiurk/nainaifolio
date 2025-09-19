import 'package:flutter/material.dart';

class OfferItem {
  final IconData icon;
  final String label;
  final String description;
  final Color color;

  const OfferItem({
    required this.icon,
    required this.label,
    required this.description,
    required this.color,
  });
}
