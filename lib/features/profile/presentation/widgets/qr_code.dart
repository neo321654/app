import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/core/widgets/Info_conatiner.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';

class QrCode extends StatelessWidget {
  const QrCode({
    super.key,
    required this.cardNumber,
  });

  final String cardNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 12,
      ),
      child: Column(
        children: [
          Text(
            'При оплате, покажите код персоналу, если хотите списать или накопить бонусы',
            style: AppStyles.body,
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: PrettyQrView.data(
              data: cardNumber.replaceAll(' ', ''),
              // decoration: const PrettyQrDecoration(
              //   image: PrettyQrDecorationImage(
              //     image: AssetImage('images/flutter.png'),
              //   ),
              // ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: cardNumber));
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: Container(
                    padding: const EdgeInsets.all(12),
                    //height: 88,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          AppStyles.radiusElement,
                        ),
                      ),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const InfoContainer(),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Text(
                            'Номер карты скопирован',
                            style: AppStyles.bodyBold.copyWith(
                              color: AppColors.dark,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              AutoRouter.of(context).pop();
            },
            child: SizedBox(
              height: 24,
              width: double.infinity,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cardNumber,
                      style: AppStyles.headline.copyWith(
                        color: AppColors.darkGray,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 2.74,
                        top: 2.71,
                        right: 2.95,
                        bottom: 2.93,
                      ),
                      width: 20,
                      height: 20,
                      child: SvgPicture.asset(
                        'assets/icons/copy.svg',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //const Spacer(),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            height: 49,
            child: ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).pop();
              },
              child: SizedBox(
                height: 24,
                child: Center(
                  child: Text(
                    'Закрыть',
                    style: AppStyles.headline.copyWith(
                      color: AppColors.white,
                      height: 24 / 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 21,
          )
        ],
      ),
    );
  }
}
