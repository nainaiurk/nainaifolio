import 'package:flutter/material.dart';

enum ScrollSection {
  Introduction,
  Education,
  Experience,
  Publications,
  Contact
}

class TopNavigationBar extends SliverPersistentHeaderDelegate {
  final Function(ScrollSection) onItemSelected;

  TopNavigationBar({required this.onItemSelected});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      height: maxExtent, // Ensure height matches the maxExtent
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () => onItemSelected(ScrollSection.Introduction),
            child: const Text("Introduction"),
          ),
          TextButton(
            onPressed: () => onItemSelected(ScrollSection.Education),
            child: const Text("Education"),
          ),
          TextButton(
            onPressed: () => onItemSelected(ScrollSection.Experience),
            child: const Text("Experience"),
          ),
          TextButton(
            onPressed: () => onItemSelected(ScrollSection.Publications),
            child: const Text("Publications"),
          ),
          TextButton(
            onPressed: () => onItemSelected(ScrollSection.Contact),
            child: const Text("Contact"),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60.0; // Set maxExtent consistent with the content

  @override
  double get minExtent => 60.0; // Set minExtent consistent with the content

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
