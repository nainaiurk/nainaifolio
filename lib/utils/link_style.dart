import 'package:flutter/material.dart';

TextStyle linkTextStyle(BuildContext context,
    {bool underline = true, double? fontSize, FontWeight? fontWeight}) {
  final theme = Theme.of(context);
  return TextStyle(
    color: theme.colorScheme.primary,
    decoration: underline ? TextDecoration.underline : TextDecoration.none,
    fontSize: fontSize,
    fontWeight: fontWeight ?? FontWeight.w600,
  );
}

/// Simple hyperlink widget (text with underline and tap handler).
class Hyperlink extends StatelessWidget {
  const Hyperlink(this.text,
      {super.key, required this.onTap, this.underline = true, this.style});

  final String text;
  final VoidCallback onTap;
  final bool underline;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: style ?? linkTextStyle(context, underline: underline),
      ),
    );
  }
}
