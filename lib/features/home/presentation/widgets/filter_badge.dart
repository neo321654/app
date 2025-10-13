import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';

class FilterBadge extends StatelessWidget {
  const FilterBadge({
    super.key,
    required this.text,
    required this.color,
    this.isActive = false,
    this.icon,
  });

  final String text;
  final Color color;
  final bool isActive;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    Widget? iconWidget;

    if (icon != null && icon!.trim().isNotEmpty) {
      if (icon!.startsWith('&#')) {
        iconWidget = SizedBox(
          width: 16,
          height: 24,
          child: HtmlWidget(icon!),
        );
      } else if (icon!.contains('.svg')) {
        iconWidget = SizedBox(
          width: 16,
          height: 24,
          child: SvgPicture.network(icon!),
        );
      } else {
        iconWidget = SizedBox(
          width: 16,
          height: 24,
          child: Image.network(
            icon!,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox.shrink();
            },
          ),
        );
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppStyles.radiusBlock)),
        color: !isActive ? AppColors.superLight : color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (iconWidget != null) iconWidget,
          if (iconWidget != null) const SizedBox(width: 4),
          Text(
            text,
            style: AppStyles.callout.copyWith(
              color: !isActive ? AppColors.dark : AppColors.white,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
