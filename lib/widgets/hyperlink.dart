import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Small widget to render an underlined hyperlink with optional icon.
class Hyperlink extends StatelessWidget {
  const Hyperlink(
    this.text, {
    super.key,
    required this.url,
    this.icon,
    this.style,
  });

  final String text;
  final String url;
  final Widget? icon;
  final TextStyle? style;

  Future<void> _open() async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final linkStyle = style ??
        TextStyle(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.underline,
        );

    return GestureDetector(
      onTap: _open,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon!, const SizedBox(width: 6)],
          Text(text, style: linkStyle),
        ],
      ),
    );
  }
}
