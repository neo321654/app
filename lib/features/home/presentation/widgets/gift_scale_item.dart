import 'package:flutter/material.dart';
import 'package:monobox/config/themes/colors.dart';

class GiftScaleItem extends StatelessWidget {
  const GiftScaleItem({
    super.key,
    this.value,
    this.width,
    required this.isActive,
  });

  final String? value;
  final bool isActive;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (value == null)
            Container(
              width: 2,
              height: 10,
              decoration: BoxDecoration(
                color: isActive ? AppColors.dark : AppColors.superLight,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    2,
                  ),
                  bottomRight: Radius.circular(
                    2,
                  ),
                ),
              ),
            ),
          // const SizedBox(
          //   height: 4,
          // ),
          if (value != null)
            Center(
              child: Text(
                value!,
                style: TextStyle(
                  color: isActive ? AppColors.dark : AppColors.gray,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                  height: 13 / 11,
                  letterSpacing: -.4,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
