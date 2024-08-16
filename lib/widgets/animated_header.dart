import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://via.placeholder.com/800x400',
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 30,
          left: 30,
          child: Opacity(
            opacity: max(0, 1 - shrinkOffset / maxExtent),
            child: const Text(
              "Welcome to My Portfolio",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 250.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
