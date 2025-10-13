import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/rounded_container.dart';
import 'adv_item.dart';

class NoAuthProfile extends StatelessWidget {
  const NoAuthProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          RoundedContainer(
            padding: const EdgeInsets.only(
              top: 28,
              right: 16,
              bottom: 16,
              left: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 32,
                    child: Text(
                      'Давайте знакомиться!',
                      style: AppStyles.title2,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                AdvItem(
                  icon: 'assets/icons/present.svg',
                  header: SizedBox(
                    height: 25,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 24,
                          child: Text(
                            'Акции и подарочные бонусы',
                            style: AppStyles.callout.copyWith(
                              color: AppColors.dark,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                          ),
                          width: 57,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.lightPrimary.withOpacity(.15),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                16,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '+150',
                                style: AppStyles.footnoteBold.copyWith(
                                  color: AppColors.lightPrimary,
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: SvgPicture.asset(
                                    'assets/icons/bonus_icn.svg',
                                    color: AppColors.lightPrimary,
                                    width: 12,
                                    height: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  text:
                      'У нас множество акций и бонусная программа. Подарок 150 бонусов при первой регистрации.',
                ),
                const SizedBox(
                  height: 16,
                ),
                AdvItem(
                  icon: 'assets/icons/guard.svg',
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'Сохраним адреса и способы оплаты',
                          style: AppStyles.callout.copyWith(
                            color: AppColors.dark,
                          ),
                        ),
                      ),
                    ],
                  ),
                  text:
                      'Быстро совершайте заказы и не беспокойтесь о сохранности данных.',
                  last: true,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 49,
                  child: ElevatedButton(
                    onPressed: () {
                      AutoRouter.of(context).push(AuthRoute());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          child: Center(
                            child: Text(
                              'Далее',
                              style: AppStyles.headline.copyWith(
                                color: AppColors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: SvgPicture.asset(
                            'assets/icons/arrow_right.svg',
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
