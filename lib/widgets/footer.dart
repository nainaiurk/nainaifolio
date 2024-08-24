import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:js' as js;

import '../utils/responsive.dart';

class Footer extends StatelessWidget {
  final String email1 = 'nainaiu.rakhaine@gmail.com';
  final String email2 = 'nainaiu52@student.sust.edu';
  final String whatsappNumber = '+8801605544977';
  final String skypeUsername = 'live:.cid.7b3b3b3b3b3b3b3b';

  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      // color: Theme.of(context).primaryColorDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Email Addresses
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContactItem(
                context,
                FontAwesomeIcons.envelope,
                email1,
                () => _launchEmail(email1),
              ),
              const SizedBox(width: 20),
              _buildContactItem(
                context,
                FontAwesomeIcons.envelope,
                email2,
                () => _launchEmail(email2),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // WhatsApp and Skype
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildContactItem(
                context,
                FontAwesomeIcons.whatsapp,
                whatsappNumber,
                () => _launchWhatsApp(whatsappNumber),
              ),
              const SizedBox(width: 20),
              _buildContactItem(
                context,
                FontAwesomeIcons.skype,
                skypeUsername,
                () => _launchSkype(skypeUsername),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
      BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          FaIcon(
            icon,
            color: Colors.white,
            size: (Responsive.isMobile(context)) ? 20.0 : 40.0,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: (Responsive.isMobile(context)) ? 10.0 : 15.0,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  void _launchEmail(String email) {
    final emailUrl = 'mailto:$email';
    js.context.callMethod('open', [emailUrl]);
  }

  void _launchWhatsApp(String number) {
    final whatsappUrl = 'https://wa.me/$number';
    js.context.callMethod('open', [whatsappUrl]);
  }

  void _launchSkype(String username) {
    final skypeUrl = 'skype:$username?chat';
    js.context.callMethod('open', [skypeUrl]);
  }
}
