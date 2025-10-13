import 'package:flutter/material.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';

class OrderBadge extends StatelessWidget {
  const OrderBadge({
    super.key,
    required this.text,
    required this.status,
  });

  final String text;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppStyles.radiusBlock,
          ),
        ),
        color: status == OrderStatus.delivered
            ? AppColors.positive
            : AppColors.lightPrimary,
      ),
      child: Text(
        text,
        style: AppStyles.caption1Bold.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}

enum OrderStatus { compleated, delivered }
