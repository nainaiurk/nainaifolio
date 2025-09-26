import 'package:flutter/material.dart';

/// Centralized responsive helpers and a small responsive widget.
/// Use the static helpers to avoid repeated calls to MediaQuery.of(context).
class ResponsiveUtils {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static bool isMobile(BuildContext context, {double mobileBreakpoint = 700}) =>
      width(context) < mobileBreakpoint;

  static bool isTablet(BuildContext context,
          {double mobileBreakpoint = 700, double tabletBreakpoint = 1100}) =>
      width(context) >= mobileBreakpoint && width(context) < tabletBreakpoint;

  static bool isDesktop(BuildContext context,
          {double desktopBreakpoint = 1100}) =>
      width(context) >= desktopBreakpoint;

  static double rem(BuildContext context, double v) {
    final w = width(context);
    final h = height(context);
    final base = (w < h ? w : h) * 0.01;
    final clamped = base.clamp(8.0, 18.0);
    return clamped * v;
  }

  static double textScale(BuildContext context) =>
      MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.6);
}

/// A small responsive layout widget that chooses one of three children.
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    if (ResponsiveUtils.isDesktop(context)) return desktop;
    if (ResponsiveUtils.isTablet(context)) return tablet;
    return mobile;
  }
}

// Small helpers for font/icon sizing. Keep them simple and pure functions.
double titleFontSize(BuildContext context) {
  if (ResponsiveUtils.isMobile(context)) return 18.0;
  if (ResponsiveUtils.isTablet(context)) return 22.0;
  return 28.0;
}

double titleIconSize(BuildContext context) {
  if (ResponsiveUtils.isMobile(context)) return 18.0;
  if (ResponsiveUtils.isTablet(context)) return 22.0;
  return 24.0;
}

/// Backwards-compatible shim. Many widgets in the codebase used a `Responsive`
/// widget and `Responsive.isMobile(...)` static helpers. Provide a thin
/// compatibility layer that delegates to the new `ResponsiveUtils` and
/// `ResponsiveLayout` implementations.
class Responsive extends StatelessWidget {
  const Responsive(
      {super.key,
      required this.mobile,
      required this.tablet,
      required this.desktop});

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  static bool isMobile(BuildContext context, {double mobileBreakpoint = 700}) =>
      ResponsiveUtils.isMobile(context, mobileBreakpoint: mobileBreakpoint);

  static bool isTablet(BuildContext context,
          {double mobileBreakpoint = 700, double tabletBreakpoint = 1100}) =>
      ResponsiveUtils.isTablet(context,
          mobileBreakpoint: mobileBreakpoint,
          tabletBreakpoint: tabletBreakpoint);

  static bool isDesktop(BuildContext context,
          {double desktopBreakpoint = 1100}) =>
      ResponsiveUtils.isDesktop(context, desktopBreakpoint: desktopBreakpoint);

  @override
  Widget build(BuildContext context) =>
      ResponsiveLayout(mobile: mobile, tablet: tablet, desktop: desktop);
}
