import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/injection_container.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/resources/store.dart';

class AddChildrenBox extends StatefulWidget {
  const AddChildrenBox({super.key});

  @override
  State<AddChildrenBox> createState() => _AddChildrenBoxState();
}

class _AddChildrenBoxState extends State<AddChildrenBox> {
  @override
  Widget build(BuildContext context) {
    if (getIt<Store>().isClosedAboutChildren()) {
      return Container();
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.lightScaffoldBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(
              AppStyles.radiusElement,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: SvgPicture.asset(
                'assets/icons/present.svg',
                color: AppColors.lightPrimary,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Text(
                'Добавьте данные о ребёнке.\nМы поздравим его с праздниками и подарим приятности!',
                style: AppStyles.footnote,
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                await getIt<Store>().closedAboutChildren();
                setState(() {
                  // Обновляем состояние виджета
                });
              },
              child: Container(
                height: 18,
                width: 18,
                padding: EdgeInsets.symmetric(
                  horizontal: 5.5,
                  vertical: 5.5,
                ),
                child: SvgPicture.asset(
                  'assets/icons/close.svg',
                  color: AppColors.darkGray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
