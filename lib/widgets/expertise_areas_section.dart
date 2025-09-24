import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/offer_item.dart';

/// Expertise section:
/// - Mobile (<600px): 2 cards per row
/// - Tablet/Desktop (>=600px): 4 cards per row
/// - Cards are tight: grid cell height ~= content height (with safety to prevent overflow)
class ExpertiseAreasSection extends StatelessWidget {
  const ExpertiseAreasSection({super.key});

  static const List<OfferItem> _offers = [
    OfferItem(
      icon: FontAwesomeIcons.microchip,
      label: 'Embedded Systems & IoT',
      description:
          'Can design System on Chip(SoC) devices using compact PCB design. Integrate to low-power ESP32/STM32 platforms, IoT pipelines, and resilient data acquisition for ready autonomous systems.',
      color: Color(0xFF1A2B4C),
    ),
    OfferItem(
      icon: FontAwesomeIcons.robot,
      label: 'Robotics Systems',
      description:
          'Integrated perception, control, and hardware stacks for Autonomous Ground Vehicle and AUV teams, delivering reliable robotics modules at scale.',
      color: Color(0xFF25385C),
    ),
    OfferItem(
      icon: FontAwesomeIcons.brain,
      label: 'TinyML & Edge Intelligence',
      description:
          'Deploying TinyML frameworks for low powered embedded devices (Microcontrollers) optimizing edge inference for sustainable monitoring.',
      color: Color(0xFF3B4F73),
    ),
    OfferItem(
      icon: FontAwesomeIcons.penNib,
      label: 'Publications & Technical Writing',
      description:
          'Authoring Q2 journal and IEEE conference papers while developing instructional PCB design content for academic and industry learners.',
      color: Color(0xFF51658C),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final baseTitleStyle = theme.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: 0.6,
      color: theme.colorScheme.primary,
    );

    double clamp(double v, double min, double max) =>
        v < min ? min : (v > max ? max : v);

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final isMobile = w < 600;
        final isTablet = w >= 600 && w < 1100;

        // Grid columns
        final cols = isMobile ? 2 : 4;
        const spacing = 8.0; // tighter spacing
        final totalSpacing = spacing * (cols - 1);
        final cardW = (w - totalSpacing) / cols;

  // Title sizes (reduced by 2px on mobile/tablet)
  final sectionTitleFont = isMobile ? 18.0 : (isTablet ? 22.0 : 28.0);
        final iconLeadingSize = clamp(sectionTitleFont * 0.6, 16, 20);

        // ===== Compact card metrics =====
        final double iconBox = isMobile ? 18.0 : (isTablet ? 26.0 : 30.0);
        final double iconSize = isMobile ? 18.0 : (isTablet ? 18.0 : 20.0);
        final double titleFont = isMobile ? 12.0 : (isTablet ? 13.5 : 14.5);
        final double hintFont = isMobile ? 8.5 : (isTablet ? 9.0 : 10.0);
        final double arrowSz = isMobile ? 8.0 : (isTablet ? 9.0 : 10.0);

        // Internal paddings & gaps
        const double cardPadV = 5.0;
        const double cardPadH = 6.0;
        const double gapAfterIcon = 4.0;
        const double gapAfterTitle = 4.0;
        const double gapBeforeArrow = 4.0;

        // === Fix overflow: include textScale + safety margin ===
        final textScale =
            MediaQuery.of(context).textScaleFactor.clamp(0.8, 1.6);
        double lineH(double font, double height) => font * height * textScale;

        final double titleLineH = lineH(titleFont, 1.18);
        final double hintLineH = lineH(hintFont, 1.14);

        // Up to 2 lines title, 1 line hint
        final double titleBlockH = titleLineH * 2;
        final double hintBlockH = hintLineH;

        // Safety pixels to absorb per-platform font differences & rounding
        final double safety = isMobile ? 6.0 : (isTablet ? 5.0 : 4.0);

        final double minContentHeight = (cardPadV * 2) +
            iconBox +
            gapAfterIcon +
            titleBlockH +
            gapAfterTitle +
            hintBlockH +
            gapBeforeArrow +
            arrowSz +
            safety; // <-- safety buffer

        final double cellH = minContentHeight;
        final double childAspectRatio = cardW / cellH;

        final titleTopPadding = w < 900 ? 16.0 : 0.0;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: titleTopPadding, bottom: 6.0),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidCircleCheck,
                      size: iconLeadingSize,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Expertise Areas',
                      style: (baseTitleStyle ?? const TextStyle())
                          .copyWith(fontSize: sectionTitleFont),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _offers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols, // 2 on mobile, 4 otherwise
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio:
                      childAspectRatio, // height ~= content + safety
                ),
                itemBuilder: (context, index) => _CompactOfferCard(
                  item: _offers[index],
                  iconBox: iconBox,
                  iconSize: iconSize,
                  titleFont: titleFont,
                  hintFont: hintFont,
                  arrowSz: arrowSz,
                  padH: cardPadH,
                  padV: cardPadV,
                  gapAfterIcon: gapAfterIcon,
                  gapAfterTitle: gapAfterTitle,
                  gapBeforeArrow: gapBeforeArrow,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CompactOfferCard extends StatelessWidget {
  const _CompactOfferCard({
    required this.item,
    required this.iconBox,
    required this.iconSize,
    required this.titleFont,
    required this.hintFont,
    required this.arrowSz,
    required this.padH,
    required this.padV,
    required this.gapAfterIcon,
    required this.gapAfterTitle,
    required this.gapBeforeArrow,
  });

  final OfferItem item;
  final double iconBox;
  final double iconSize;
  final double titleFont;
  final double hintFont;
  final double arrowSz;

  final double padH;
  final double padV;
  final double gapAfterIcon;
  final double gapAfterTitle;
  final double gapBeforeArrow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final background = isDark ? theme.cardColor : theme.colorScheme.surface;

    return InkWell(
      onTap: () => _showDetailsDialog(context),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padH, vertical: padV),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                item.color.withOpacity(0.7), // kept visible but not too heavy
            width: 1,
          ),
          boxShadow: isDark
              ? const []
              : [
                  BoxShadow(
                    color: item.color.withOpacity(0.8),
                    blurRadius: 6,
                    offset: const Offset(0, 1),
                  ),
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon
            Container(
              width: iconBox,
              height: iconBox,
              decoration: BoxDecoration(
                color: item.color.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: FaIcon(item.icon, size: iconSize, color: item.color),
              ),
            ),
            SizedBox(height: gapAfterIcon),

            // Title (2 lines max by design)
            Text(
              item.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: titleFont,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.15,
                color: theme.colorScheme.primary,
                height: 1.12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: gapAfterTitle),

            // Hint
            Text(
              'Tap for details',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: hintFont,
                color: theme.textTheme.bodySmall?.color?.withOpacity(0.9),
                height: 1.1,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            // Arrow at bottom
            Icon(Icons.arrow_forward_ios, size: arrowSz, color: item.color),
          ],
        ),
      ),
    );
  }

  void _showDetailsDialog(BuildContext context) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: item.color.withOpacity(0.12),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: FaIcon(item.icon, size: 20, color: item.color),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        item.label,
                        style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary,
                            ) ??
                            TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.primary,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  item.description,
                  style: theme.textTheme.bodyLarge?.copyWith(
                        height: 1.45,
                        color: theme.textTheme.bodyLarge?.color,
                      ) ??
                      TextStyle(
                        fontSize: 15,
                        height: 1.45,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'Close',
                      style: TextStyle(
                        color: item.color,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
