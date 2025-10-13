import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:monobox/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:monobox/features/profile/presentation/bloc/delete_profile/delete_profile_bloc.dart';
import 'package:monobox/injection_container.dart';

import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/widgets/rounded_container.dart';
import '../widgets/loyalty_desc_item.dart';

@RoutePage()
class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<DeleteProfileBloc>(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<DeleteProfileBloc, DeleteProfileState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (status) {
                  if (status.status.toLowerCase() == 'success') {
                    context.read<AuthBloc>().add(LogoutRequested());
                  }
                },
                orElse: () => null,
              );
            },
          ),
        ],
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        ),
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
                  'Удаление аккаунта',
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'При удалении вы лишитесь',
              style: AppStyles.title2,
            ),
          ),
          const SizedBox(height: 20),
          RoundedContainer(
            child: Column(
              children: [
                const LoyaltyDescItem(
                  title: 'Бонусов',
                  description: 'Текущий баланс будет уничтожен.',
                  icon: 'assets/icons/bonus_box.svg',
                ),
                const SizedBox(
                  height: 24,
                ),
                const LoyaltyDescItem(
                  title: 'Статуса гостя',
                  description:
                      'Достигнутый статус будет потерян. Вы не сможете экономить на заказах.',
                  icon: 'assets/icons/bonus_box.svg',
                ),
                const SizedBox(
                  height: 24,
                ),
                const LoyaltyDescItem(
                  title: 'История заказов, карты и адреса',
                  description:
                      'Вы потеряете доступ ко всем сохраннёным данным на аккаунте.',
                  icon: 'assets/icons/bonus_box.svg',
                  isLast: true,
                ),
                const SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.router.pop();
                    },
                    child: const Text(
                      'Остаться',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: BlocBuilder<DeleteProfileBloc, DeleteProfileState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: AppStyles.superLightElevatedButton,
                        onPressed: () async {
                          state.maybeWhen(orElse: () async {
                            final bool? result = await showDialog<bool?>(
                                context: context,
                                builder: (BuildContext context) {
                                  return _confirmDeleteAccountDialog(context);
                                });

                            if (result != null && result) {
                              if (!context.mounted) return;
                              getIt<DeleteProfileBloc>()
                                  .add(const DeleteProfileEvent.delete());
                              context.router.pop();
                            }
                          });
                        },
                        child:
                            BlocBuilder<DeleteProfileBloc, DeleteProfileState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              deleting: () => const Padding(
                                padding: EdgeInsets.all(
                                  4,
                                ),
                                child: CircularProgressIndicator(),
                              ),
                              orElse: () => Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: SvgPicture.asset(
                                      'assets/icons/cross.svg',
                                      width: 20,
                                      height: 20,
                                      color: AppColors.destructive,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  const Text(
                                    'Всё равно удалить',
                                    style:
                                        TextStyle(color: AppColors.destructive),
                                  ),
                                ],
                              ),
                            );
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: SvgPicture.asset(
                                    'assets/icons/cross.svg',
                                    width: 20,
                                    height: 20,
                                    color: AppColors.destructive,
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  'Всё равно удалить',
                                  style:
                                      TextStyle(color: AppColors.destructive),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _confirmDeleteAccountDialog(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: const Text("Удалить аккаунт?"),
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
              "Удалить",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF007AFF),
              ),
            ),
          ),
        ],
        content: const Text(
          "Восстановить его будет невозможно",
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
      title: const Text("Удалить аккаунт?"),
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
            "Удалить",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF007AFF),
            ),
          ),
        ),
      ],
      content: const Text(
        "Восстановить его будет невозможно",
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
