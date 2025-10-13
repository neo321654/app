import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/config/themes/colors.dart';
import 'package:monobox/features/basket/presentation/bloc/basket/basket_bloc.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/styles.dart';
import '../widgets/basket_badge.dart';

@RoutePage()
class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double barItemIconContainerWidth = 52;
    const double barItemIconContainerHeight = 30;

    return WillPopScope(
      onWillPop: () {
        final router = context.router;
        if (router.canNavigateBack) {
          router.back();
        }
        return SynchronousFuture(!router.canNavigateBack);
      },
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        bottom: false,
        child: AutoTabsScaffold(
          lazyLoad: false,
          routes: [
            const HomeRoute(),
            const BasketRoute(),
            const ProfileRoute(),
            //AuthRoute(),
            MoreRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            BasketBloc basketBloc = context.watch<BasketBloc>();
            return Visibility(
              visible: !(basketBloc.productsCount != null &&
                  basketBloc.productsCount! > 0 &&
                  (context.router.currentPath
                          .contains('/home-navigation-route/catalog-route') ||
                      context.router.currentPath
                          .contains('/create-order-route'))),
              child: SizedBox(
                height: MediaQuery.viewPaddingOf(context).bottom + 56,
                child: BottomNavigationBar(
                  enableFeedback: true,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: tabsRouter.activeIndex,
                  selectedIconTheme: const IconThemeData(
                    color: AppColors.darkPrimary,
                  ),
                  unselectedIconTheme: const IconThemeData(
                    color: AppColors.gray,
                  ),
                  selectedFontSize: 10,
                  unselectedFontSize: 10,
                  selectedItemColor: AppColors.darkPrimary,
                  unselectedItemColor: AppColors.gray,
                  showUnselectedLabels: true,
                  items: [
                    BottomNavigationBarItem(
                      label: 'Главная',
                      icon: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        width: barItemIconContainerWidth,
                        height: barItemIconContainerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppStyles.mediumRadius),
                          ),
                        ),
                        child: SizedBox(
                          width: 28,
                          height: 28,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/home.svg',
                              width: 19.48,
                              height: 21.4,
                            ),
                          ),
                        ),
                      ),
                      activeIcon: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        width: barItemIconContainerWidth,
                        height: barItemIconContainerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppStyles.mediumRadius),
                          ),
                          color: AppColors.lightPrimary.withOpacity(.1),
                        ),
                        child: SizedBox(
                          width: 28,
                          height: 28,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/home_active.svg',
                              colorFilter: const ColorFilter.mode(
                                AppColors.darkPrimary,
                                BlendMode.srcIn,
                              ),
                              width: 19.48,
                              height: 21.4,
                            ),
                          ),
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Корзина',
                      icon: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        width: barItemIconContainerWidth,
                        height: barItemIconContainerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppStyles.mediumRadius),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              top: 0,
                              child: SizedBox(
                                width: 28,
                                height: 28,
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/basket.svg',
                                    width: 22.93,
                                    height: 21.88,
                                  ),
                                ),
                              ),
                            ),
                            if (basketBloc.productsCount != null &&
                                basketBloc.productsCount! > 0)
                              Positioned(
                                right: 0,
                                top: 1,
                                child: BasketBadge(
                                  counter: basketBloc.productsCount!,
                                  active: true,
                                ),
                              ),
                          ],
                        ),
                      ),
                      activeIcon: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        width: barItemIconContainerWidth,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppStyles.mediumRadius),
                          ),
                          color: AppColors.lightPrimary.withOpacity(.1),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              top: 0,
                              child: SizedBox(
                                width: 28,
                                height: 28,
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/basket_active.svg',
                                    colorFilter: const ColorFilter.mode(
                                      AppColors.darkPrimary,
                                      BlendMode.srcIn,
                                    ),
                                    width: 22.93,
                                    height: 21.88,
                                  ),
                                ),
                              ),
                            ),
                            if (basketBloc.productsCount != null &&
                                basketBloc.productsCount! > 0)
                              Positioned(
                                right: 0,
                                top: 2,
                                child: BasketBadge(
                                  counter: basketBloc.productsCount!,
                                  active: true,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Профиль',
                      icon: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        width: barItemIconContainerWidth,
                        height: barItemIconContainerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppStyles.mediumRadius),
                          ),
                        ),
                        child: SizedBox(
                          width: 28,
                          height: 28,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/profile.svg',
                              width: 18.08,
                              height: 19.2,
                            ),
                          ),
                        ),
                      ),
                      activeIcon: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        width: barItemIconContainerWidth,
                        height: barItemIconContainerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppStyles.mediumRadius),
                          ),
                          color: AppColors.lightPrimary.withOpacity(.1),
                        ),
                        child: SizedBox(
                          width: 28,
                          height: 28,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/icons/profile_active.svg',
                              colorFilter: const ColorFilter.mode(
                                AppColors.darkPrimary,
                                BlendMode.srcIn,
                              ),
                              width: 18.08,
                              height: 19.2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Ещё',
                      icon: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 12,
                        ),
                        width: barItemIconContainerWidth,
                        height: barItemIconContainerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppStyles.mediumRadius),
                          ),
                        ),
                        child: Center(
                          child: Container(
                            width: 28,
                            height: 28,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.25,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/more.svg',
                            ),
                          ),
                        ),
                      ),
                      activeIcon: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 12,
                        ),
                        width: barItemIconContainerWidth,
                        height: barItemIconContainerHeight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(AppStyles.mediumRadius),
                          ),
                          color: AppColors.lightPrimary.withOpacity(.1),
                        ),
                        child: Center(
                          child: Container(
                            width: 28,
                            height: 28,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.25,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/more_active.svg',
                              colorFilter: const ColorFilter.mode(
                                AppColors.darkPrimary,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                  onTap: (index) {
                    if (index == 0) {
                      context.navigateTo(const HomeRoute());
                    }
                    if (index == 1) {
                      context.navigateTo(const BasketRoute());
                    }
                    if (index == 2) {
                      context.navigateTo(const ProfileRoute());
                    }
                    if (index == 3) {
                      context.navigateTo(MoreRoute());
                    }
                    tabsRouter.setActiveIndex(index);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
