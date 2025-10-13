import 'package:flutter/material.dart';

import '../../config/themes/colors.dart';
import '../../config/themes/styles.dart';

class TextSwitcher extends StatelessWidget {
  const TextSwitcher({
    super.key,
    required this.items,
    this.selectedIndex = 0,
    this.onTap,
  });

  final List<String> items;
  final int selectedIndex;
  final void Function(int itemIndex)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.superLight,
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppStyles.radiusElement,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items
            .map((i) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      if (onTap != null) {
                        onTap!(items.indexOf(i));
                      }
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: items.indexOf(i) == selectedIndex
                            ? AppColors.white
                            : AppColors.superLight,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            AppStyles.xsmallRadius,
                          ),
                        ),
                        boxShadow: items.indexOf(i) == selectedIndex
                            ? [
                                BoxShadow(
                                  color:
                                      AppColors.lightDarkGray.withOpacity(.05),
                                  blurRadius: 8.0,
                                  offset: const Offset(
                                    0.0,
                                    4.0,
                                  ),
                                )
                              ]
                            : null,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          i,
                          style: AppStyles.footnoteBold.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
