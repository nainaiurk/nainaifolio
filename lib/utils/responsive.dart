import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isDesktop(context)) {
      return desktop;
    } else if (Responsive.isTablet(context)) {
      return tablet;
    } else {
      return mobile;
    }
  }
}

class TitleFontSize {
  double titleFontSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 22.0;
    if (Responsive.isTablet(context)) return 28.0;
    return 32.0; // Desktop
  }
}

class TitleIconSize {
  double titleIconSize(BuildContext context) {
    if (Responsive.isMobile(context)) return 30.0;
    if (Responsive.isTablet(context)) return 36.0;
    return 40.0; // Desktop
  }
}
