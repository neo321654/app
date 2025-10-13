import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/input_text.dart';

class CashPropouse extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  const CashPropouse({
    super.key,
    required this.controller,
    this.onSubmitted,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: InputText(
        controller: controller,
        hintText: 'С какой суммы нужна сдача?',
        keyboardType: TextInputType.number,
        onSubmitted: onSubmitted,
      ),
    );

    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 16,
        top: 14,
        right: 12,
        bottom: 14,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightScaffoldBackground,
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppStyles.radiusElement,
          ),
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'С какой суммы нужна сдача?',
              style: AppStyles.subheadBold.copyWith(
                color: AppColors.gray,
              ),
            ),
            SizedBox(
              width: 28,
              height: 28,
              child: Center(
                child: SizedBox(
                  width: 11.08,
                  height: 6.42,
                  child: SvgPicture.asset(
                    'assets/icons/arrow_down.svg',
                    color: AppColors.gray,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
