import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../domain/entities/loyalty_entity.dart';
import '../bloc/loyalty/loyalty_bloc.dart';
import '../bloc/profile/profile_cubit.dart';

class ProfileBonusses extends StatelessWidget {
  const ProfileBonusses({
    super.key,
    this.isClickabel = true,
  });

  final bool isClickabel;

  @override
  Widget build(BuildContext context) {
    LoyaltyEntity? currentLoyalty;
    LoyaltyEntity? nextLoyalty;

    context.watch<LoyaltyBloc>().state.maybeMap(
          success: (result) {
            final int totalLoyalties = result.loyalties.length;
            for (int i = 0; i < totalLoyalties; i++) {
              if (result.loyalties[i].active) {
                currentLoyalty = result.loyalties[i];
                if (i < totalLoyalties) {
                  nextLoyalty = result.loyalties[i + 1];
                }
              }
            }
          },
          orElse: () => null,
        );

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                AppStyles.radiusBlock,
              ),
            ),
            color: AppColors.lightPrimary,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    context.watch<ProfileCubit>().state.maybeMap(
                          done: (value) => '${value.profile.bonus!.count}',
                          orElse: () => '0',
                        ),
                    style: AppStyles.title1.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: SvgPicture.asset(
                      'assets/icons/bonus_icn.svg',
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '1',
                    style: AppStyles.caption1.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                    child: SvgPicture.asset(
                      'assets/icons/bonus_icn.svg',
                    ),
                  ),
                  Text(
                    '= 1 ₽',
                    style: AppStyles.caption1.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Text(
                'бонусов у вас',
                style: AppStyles.footnote.copyWith(
                  color: AppColors.white,
                ),
              ),
              const Spacer(),
              // context.watch<ProfileCubit>().state.maybeMap(
              //       done: (value) => value.profile.bonus!.numberCard != null
              //           ? QrButton(
              //               numberCard: value.profile.bonus!.numberCard!,
              //             )
              //           : Container(),
              //       orElse: () => Container(),
              //     ),
            ],
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: GestureDetector(
            onTap: () =>
                isClickabel ? context.router.push(const LoyaltyRoute()) : null,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              height: 140,
              width: 155,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0,
                  color: AppColors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppStyles.radiusBlock,
                  ),
                ),
                color: AppColors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Кэшбек ${currentLoyalty?.discount ?? "..."}',
                    style: AppStyles.title2.copyWith(
                      color: AppColors.dark,
                    ),
                  ),
                  Text(
                    'от заказа бонусами',
                    style: AppStyles.footnote,
                  ),
                  const Spacer(),
                  if (nextLoyalty != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'До уровня ${nextLoyalty?.discount ?? "..."}',
                              style: AppStyles.footnote,
                            ),
                            context.watch<ProfileCubit>().state.maybeMap(
                                  done: (value) =>
                                      value.profile.bonus!.sumStill != null
                                          ? Text(
                                              value.profile.bonus!.sumStill!,
                                              style: AppStyles.footnote,
                                            )
                                          : Container(
                                              height: 18,
                                            ),
                                  orElse: () => Container(
                                    height: 18,
                                  ),
                                ),
                          ],
                        ),
                        if (isClickabel)
                          SizedBox(
                            height: 10.75,
                            width: 6.22,
                            child: SvgPicture.asset(
                              'assets/icons/arrow_right.svg',
                              color: AppColors.gray,
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
