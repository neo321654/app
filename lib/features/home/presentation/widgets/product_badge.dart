import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../domain/entities/tag_entity.dart';

class ProductBadge extends StatelessWidget {
  const ProductBadge({
    super.key,
    required this.tag,
  });

  final TagEntity tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 4,
        top: 2,
        right: 10,
        bottom: 2,
      ),
      height: 18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppStyles.radiusBlock,
          ),
        ),
        color: tag.color,
      ),
      child: SizedBox(
        height: 18,
        child: Row(
          children: [
            if (tag.icon != null && tag.icon!.startsWith('&#'))
              SizedBox(
                height: 14,
                width: 11,
                child: Center(
                  child: HtmlWidget(
                    tag.icon!,
                    textStyle: const TextStyle(
                      fontSize: 9,
                      height: 1,
                    ),
                  ),
                ),
              ),
            if (tag.icon != null &&
                !tag.icon!.startsWith('&#') &&
                !tag.icon!.contains('.svg'))
              SizedBox(
                width: 11,
                child: Image.network(tag.icon!),
              ),
            if (tag.icon != null && tag.icon!.contains('.svg'))
              SizedBox(
                width: 11,
                child: SvgPicture.network(
                  tag.icon!,
                ),
              ),
            if (tag.icon != null)
              const SizedBox(
                width: 2,
              ),
            Center(
              child: Text(
                tag.title,
                style: AppStyles.caption2Bold.copyWith(
                  color: AppColors.white,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
