import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/config/routes/app_router.dart';
import 'package:monobox/features/profile/presentation/bloc/profile/profile_cubit.dart';
import 'package:monobox/injection_container.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../bloc/add_child/add_child_bloc.dart';
import '../bloc/loyalty/loyalty_bloc.dart';
import '../widgets/loyalty_desc_item.dart';
import '../widgets/profile_bonusses.dart';

@RoutePage()
class LoyaltyPage extends StatelessWidget {
  const LoyaltyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AddChildBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.white.withOpacity(.05),
              blurRadius: 8.0,
              offset: const Offset(
                0.0,
                4.0,
              ),
            )
          ],
        ),
        child: AppBar(
          elevation: 0.0,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          titleSpacing: 0,
          leadingWidth: (32 + 16),
          leading: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => context.popRoute(),
              child: Center(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: 17.33,
                      height: 12.67,
                      child: SvgPicture.asset(
                        'assets/icons/arrow_back_android.svg',
                        width: 17.33,
                        height: 5,
                        colorFilter: const ColorFilter.mode(
                          AppColors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Бонусный статус',
                  style: AppStyles.headline.copyWith(height: 1),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    final double width = MediaQuery.of(context).size.width - (16 * 2);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          context.watch<ProfileCubit>().state.maybeMap(
                done: (value) => value.profile.bonus != null
                    ? value.profile.bonus!.available
                        ? const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: ProfileBonusses(isClickabel: false),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 20,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                context.router.push(
                                  const LoyalEntityRoute(),
                                );
                              },
                              child: Container(
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
                                    Text(
                                      'Копите бонусы',
                                      style: AppStyles.title1
                                          .copyWith(color: AppColors.white),
                                    ),
                                    Text(
                                      'в программе лояльности',
                                      style: AppStyles.footnote
                                          .copyWith(color: AppColors.white),
                                    ),
                                    const Spacer(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      height: 36,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            AppStyles.radiusElement,
                                          ),
                                        ),
                                        color: AppColors.white,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Зарегистрироваться',
                                            style:
                                                AppStyles.subheadBold.copyWith(
                                              color: AppColors.black,
                                              height: 1,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 24,
                                            child: SvgPicture.asset(
                                              'assets/icons/arrow_right.svg',
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                AppColors.black,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                    : Container(),
                orElse: () => Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 20,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(
                        const LoyalEntityRoute(),
                      );
                    },
                    child: Container(
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
                          Text(
                            'Копите бонусы',
                            style: AppStyles.title1
                                .copyWith(color: AppColors.white),
                          ),
                          Text(
                            'в программе лояльности',
                            style: AppStyles.footnote
                                .copyWith(color: AppColors.white),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            height: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  AppStyles.radiusElement,
                                ),
                              ),
                              color: AppColors.white,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Зарегистрироваться',
                                  style: AppStyles.subheadBold.copyWith(
                                    color: AppColors.black,
                                    height: 1,
                                  ),
                                ),
                                SizedBox(
                                  width: 24,
                                  child: SvgPicture.asset(
                                    'assets/icons/arrow_right.svg',
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.black,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Как это работает?',
              style: AppStyles.title2,
            ),
          ),
          const SizedBox(height: 20),
          RoundedContainer(
            child: Column(
              children: [
                BlocBuilder<LoyaltyBloc, LoyaltyState>(
                  builder: (context, state) {
                    bool activeWas = false;

                    return state.maybeWhen(
                      success: (loyalties) => SizedBox(
                        height: 90,
                        width: double.infinity,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: loyalties.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = loyalties[index];
                            final bool isActive = activeWas;

                            if (item.active) {
                              activeWas = true;
                            }

                            return TimelineTile(
                              axis: TimelineAxis.horizontal,
                              lineXY: .7,
                              isFirst: index == 0,
                              //isLast: (index + 1) == loyalties.length,
                              alignment: TimelineAlign.manual,
                              endChild: SizedBox(
                                width: width / loyalties.length,
                                height: 18,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.discount,
                                        style: AppStyles.footnoteBold.copyWith(
                                          color: !item.active
                                              ? AppColors.gray
                                              : AppColors.lightPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              startChild: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: width / loyalties.length,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.title,
                                        style: AppStyles.subheadBold.copyWith(
                                          color: AppColors.darkGray,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        item.sumFrom,
                                        style: AppStyles.caption2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              beforeLineStyle: LineStyle(
                                color: isActive
                                    ? AppColors.lightGray
                                    : AppColors.lightPrimary,
                                thickness: 2,
                              ),
                              afterLineStyle: LineStyle(
                                //color: isActive ? AppColors.lightGray : AppColors.lightPrimary,
                                color: isActive || activeWas
                                    ? AppColors.lightGray
                                    : AppColors.lightPrimary,
                                thickness: 2,
                              ),
                              indicatorStyle: IndicatorStyle(
                                width: 8,
                                height: 8,
                                color: isActive
                                    ? AppColors.lightGray
                                    : AppColors.lightPrimary,
                                indicatorXY: 0,
                              ),
                            );
                          },
                        ),
                      ),
                      orElse: () => Container(),
                    );
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                const LoyaltyDescItem(
                  title: 'Сделайте заказ',
                  description: '',
                  icon: 'assets/icons/how_works1.svg',
                ),
                const SizedBox(
                  height: 24,
                ),
                const LoyaltyDescItem(
                  title:
                      'Мы начислим бонусы в зависимости\nот вашего статуса заказ',
                  description: '',
                  icon: 'assets/icons/how_works2.svg',
                ),
                const SizedBox(
                  height: 24,
                ),
                const LoyaltyDescItem(
                  title: 'Повысим ваш статус за покупки',
                  description: '',
                  icon: 'assets/icons/how_works3.svg',
                ),
                const SizedBox(
                  height: 24,
                ),
                const LoyaltyDescItem(
                  title: 'Можете списать бонусами до 35% от суммы заказа',
                  description: '',
                  icon: 'assets/icons/how_works4.svg',
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
