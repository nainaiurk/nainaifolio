import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Contact Me",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(labelText: 'Name'),
          ),
          const TextField(
            decoration: InputDecoration(labelText: 'Email'),
          ),
          const TextField(
            decoration: InputDecoration(labelText: 'Message'),
            maxLines: 5,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle form submission
            },
            child: const Text("Send Message"),
          ),
        ],
      ),
    );
  }
}
