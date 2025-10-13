import 'package:flutter/material.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';

class DeliveryImmediately extends StatelessWidget {
  const DeliveryImmediately({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppStyles.radiusElement,
          ),
        ),
        color: AppColors.lightScaffoldBackground,
      ),
      child: Text(
        'Завершите оформление заказа и мы рассчитаем более точное время',
        style: AppStyles.body,
      ),
    );
  }
}
