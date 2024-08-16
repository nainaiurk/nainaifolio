import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.linked_camera),
            onPressed: () {
              // Open LinkedIn
            },
          ),
          IconButton(
            icon: const Icon(Icons.camera),
            onPressed: () {
              // Open Instagram
            },
          ),
          IconButton(
            icon: const Icon(Icons.code),
            onPressed: () {
              // Open GitHub
            },
          ),
        ],
      ),
    );
  }
}
