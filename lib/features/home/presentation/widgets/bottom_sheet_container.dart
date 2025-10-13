import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
    required this.child,
    this.header,
    this.mode = 'header',
    this.heightFactor,
  });

  final Widget child;
  final Widget? header;
  final String mode;
  final double? heightFactor;

  @override
  Widget build(BuildContext context) {
    if (mode == 'header') {
      return FractionallySizedBox(
        heightFactor: heightFactor ?? 0.9,
        child: Container(
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 60,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(AppStyles.radiusElement),
                      ),
                      color: AppColors.lightGray,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: header != null
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    if (header != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: header!,
                      ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        alignment: Alignment.center,
                        height: 34,
                        width: 66,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColors.lightGray,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.75,
                              vertical: 10.75,
                            ),
                            width: 30,
                            height: 30,
                            child: SvgPicture.asset(
                              'assets/icons/close.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: child,
                ),
              ],
            ),
          ),
        ),
      );
    }

    if (mode == 'autosize') {
      return Container(
        //constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .8),
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      width: 60,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppStyles.radiusElement),
                        ),
                        color: AppColors.lightGray,
                      ),
                    ),
                  ),
                  if (header != null)
                    Row(
                      mainAxisAlignment: header != null
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.end,
                      children: [
                        if (header != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: header!,
                          ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          behavior: HitTestBehavior.translucent,
                          child: Container(
                            alignment: Alignment.center,
                            height: 34,
                            width: 66,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.lightGray,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.75,
                                  vertical: 10.75,
                                ),
                                width: 30,
                                height: 30,
                                child: SvgPicture.asset(
                                  'assets/icons/close.svg',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  child,
                  // Expanded(
                  //   child: child,
                  // ),
                ],
              ),
              if (header == null)
                Positioned(
                  right: 0,
                  top: 4,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                      alignment: Alignment.center,
                      height: 34,
                      width: 66,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.lightGray,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.75,
                            vertical: 10.75,
                          ),
                          width: 30,
                          height: 30,
                          child: SvgPicture.asset(
                            'assets/icons/close.svg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    }
    return FractionallySizedBox(
      heightFactor: heightFactor ?? 0.9,
      child: Container(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 60,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppStyles.radiusElement),
                        ),
                        color: AppColors.lightGray,
                      ),
                    ),
                  ),
                  Expanded(
                    child: child,
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 16,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    alignment: Alignment.center,
                    height: 34,
                    width: 66,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.lightGray,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.75,
                          vertical: 10.75,
                        ),
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset(
                          'assets/icons/close.svg',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
