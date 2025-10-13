import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/config/routes/app_router.dart';
import 'package:monobox/features/home/presentation/bloc/settings/settings_bloc.dart';
import 'package:monobox/features/profile/presentation/bloc/profile/profile_cubit.dart';

import 'package:monobox/injection_container.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../auth/presentation/bloc/auth/auth_bloc.dart';
import '../../../basket/presentation/widgets/basket_action_button.dart';
import '../../../order/presentation/bloc/orders_list/orders_list_bloc.dart';
import 'profile_bonusses.dart';
import 'profile_items.dart';
import 'profile_orders.dart';
import 'profile_orders_preloader.dart';
import 'profile_salute.dart';

class AuthProfile extends StatelessWidget {
  const AuthProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<OrdersListBloc>()
        ..add(
          const OrdersListEvent.getOrders(),
        ),
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
          //backgroundColor: AppColors.white,
          //titleSpacing: 0,
          title: const PofileSalute(),
          actions: [
            Center(
              child: SizedBox(
                height: 44,
                child: BasketActionButton(
                  asset: 'assets/icons/logout.svg',
                  onPressed: () async {
                    final bool? result = await showDialog<bool?>(
                        context: context,
                        builder: (BuildContext context) {
                          return _logoutDialog(context);
                        });

                    if (result != null && result) {
                      if (!context.mounted) return;
                      context.read<AuthBloc>().add(LogoutRequested());
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
  ) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            context.watch<ProfileCubit>().state.maybeMap(
                  done: (value) => value.profile.bonus != null &&
                          context.watch<SettingsBloc>().state.maybeWhen(
                                success: (success) => success.loyalty,
                                orElse: () => false,
                              )
                      ? value.profile.bonus!.available
                          ? const Padding(
                              padding: EdgeInsets.only(
                                left: 16,
                                right: 16,
                                bottom: 20,
                              ),
                              child: ProfileBonusses(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              style: AppStyles.subheadBold
                                                  .copyWith(
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
                  orElse: () => Container(),
                ),
            BlocBuilder<OrdersListBloc, OrdersListState>(
              builder: (context, state) {
                return state.maybeWhen(
                  success: (orders) => orders.isNotEmpty
                      ? Column(
                          children: [
                            ProfileOrders(orders: orders),
                            const SizedBox(
                              height: 32,
                            ),
                          ],
                        )
                      : Container(),
                  loading: () => const Column(
                    children: [
                      ProfileOrdersPreloader(),
                      SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                  orElse: () => Container(),
                );
                //return ProfileOrders();
              },
            ),
            // SizedBox(
            //   height: 32,
            // ),
            ProfileItems(),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _logoutDialog(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        //backgroundColor: Color(0xFFECE6F0),
        title: const Text("Выйти из аккаунта?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              "Отмена",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              "Выйти",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
        ],
        content: const Text(
          "Чтобы вернуться, нужно будет заново пройти авторизацию",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14,
            height: 20 / 14,
            letterSpacing: .25,
            color: Color(0xFF000000),
          ),
        ),
      );
    }

    return AlertDialog(
      title: const Text("Выйти из аккаунта?"),
      titleTextStyle: AppStyles.title2.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      actionsOverflowButtonSpacing: 20,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(
            "Отмена",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF007AFF),
            ),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(
            "Выйти",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF007AFF),
            ),
          ),
        ),
      ],
      content: const Text(
        "Чтобы вернуться, нужно будет заново пройти авторизацию",
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: .25,
          color: Color(0xFF000000),
        ),
      ),
    );
  }
}
