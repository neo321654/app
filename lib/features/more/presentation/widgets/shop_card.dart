import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../domain/entities/shop_entity.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    super.key,
    required this.shop,
  });

  final ShopEntity shop;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              shop.openTime ?? '',
              style: AppStyles.footnote.copyWith(
                color: AppColors.positive,
              ),
            ),
            if (shop.openTime != null)
              const SizedBox(
                width: 8,
              ),
            Text(
              shop.distance ?? '',
              style: AppStyles.footnote,
            ),
            const Spacer(),
            SizedBox(
              width: 28,
              height: 28,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: SvgPicture.asset(
                  'assets/icons/more.svg',
                  color: AppColors.gray,
                ),
                onPressed: () async {
                  final result = await showAdaptiveActionSheet<String>(
                    context: context,
                    androidBorderRadius: 30,
                    actions: [
                      BottomSheetAction(
                        onPressed: (context) async {
                          await Clipboard.setData(
                              ClipboardData(text: shop.address));
                          if (!context.mounted) return;
                          AutoRouter.of(context).pop('clipboard');
                        },
                        title: Text(
                          'Скопировать адрес',
                          style: AppStyles.bodyRegular.copyWith(
                            color: !Platform.isIOS
                                ? AppColors.black
                                : const Color(0xFF007AFF),
                          ),
                        ),
                      ),
                      BottomSheetAction(
                        onPressed: (context) {
                          if (!context.mounted) return;
                          AutoRouter.of(context).pop('basket');
                        },
                        title: Text(
                          'Заказать самовывоз',
                          style: AppStyles.bodyRegular.copyWith(
                            color: !Platform.isIOS
                                ? AppColors.black
                                : const Color(0xFF007AFF),
                          ),
                        ),
                      ),
                      BottomSheetAction(
                        onPressed: (context) {
                          AutoRouter.of(context).pop();
                        },
                        title: Text(
                          'Найти в 2ГИС',
                          style: AppStyles.bodyRegular.copyWith(
                            color: !Platform.isIOS
                                ? AppColors.black
                                : const Color(0xFF007AFF),
                          ),
                        ),
                      ),
                    ],
                    cancelAction: CancelAction(
                      title: const Text('Отмена'),
                    ),
                  );

                  if (result != null) {
                    if (!context.mounted) return;

                    if (result == 'clipboard') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Адрес скопирован'),
                        ),
                      );
                    }

                    if (result == 'basket') {
                      context.navigateNamedTo('/basket');
                    }
                  }
                },
              ),
            ),
          ],
        ),
        Text(
          shop.address,
          style: AppStyles.headline,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        // if (shop.waitingTime != null)
        //   const SizedBox(
        //     height: 4,
        //   ),
        // if (shop.waitingTime != null)
        //   Text(
        //     'Время ожидания ${shop.waitingTime!}',
        //     style: AppStyles.subheadBold.copyWith(color: AppColors.gray),
        //   ),
        if (shop.workTime?.isNotEmpty == true)
          const SizedBox(
            height: 16,
          ),
        if (shop.workTime?.isNotEmpty == true)
          Text(
            shop.workTime![0],
            style: AppStyles.footnote,
          ),
      ],
    );
  }
}
