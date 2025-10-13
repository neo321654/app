import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monobox/features/address_setup/presentation/bloc/user_address/user_address_bloc.dart';
import 'package:monobox/features/home/domain/entities/settings_entity.dart';

import 'package:monobox/features/profile/presentation/widgets/my_address.dart';

import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/colors.dart';
import '../../../../config/themes/styles.dart';
import '../../../../core/resources/store.dart';
import '../../../../injection_container.dart';
import '../models/profile_item.dart' as profile_item_model;
import 'add_children.dart';
import 'profile_item.dart';

class ProfileItems extends StatelessWidget {
  final SettingsEntity? settings;

  ProfileItems({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 28,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppStyles.radiusBlock,
          ),
        ),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightDarkGray.withOpacity(.1),
            blurRadius: 12.0,
            offset: const Offset(
              0.0,
              0.0,
            ),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: BlocBuilder<UserAddressBloc, UserAddressState>(
                  builder: (context, state) {
                    return const MyAddress();
                  },
                ),
              ),
              /*const SizedBox(
                width: 12,
              ),
              const Expanded(
                child: MyCards(),
              ),*/
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final filteredItems = _getFilteredItems(settings);
              if (index >= filteredItems.length) return const SizedBox.shrink();

              return ProfileItem(
                icon: filteredItems[index].icon,
                text: filteredItems[index].text,
                subText: filteredItems[index].text == 'Добавить ребёнка'
                    ? const AddChildrenBox()
                    : null,
                textColor: (index + 1) == filteredItems.length
                    ? AppColors.destructive
                    : null,
                showArrow: (index + 1) != filteredItems.length,
                onTap: (BuildContext context) =>
                    filteredItems[index].onTap != null
                        ? filteredItems[index].onTap!(context)
                        : null,
              );
            },
            separatorBuilder: (context, index) {
              final filteredItems = _getFilteredItems(settings);
              if (index >= filteredItems.length - 1) {
                return const SizedBox.shrink();
              }

              return Container(
                height: 20,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                ),
              );
            },
            itemCount: _getFilteredItems(settings).length,
          ),
        ],
      ),
    );
  }

  List<profile_item_model.ProfileItem> _getFilteredItems(
      SettingsEntity? settings) {
    final store = getIt<Store>();
    final isChildrenClosedLocally = store.isClosedAboutChildren();

    // Условие для скрытия: false от сервера ИЛИ если пользователь закрыл блок локально.
    final bool hideBasedOnServer = settings != null && !settings.children;

    if (hideBasedOnServer || isChildrenClosedLocally) {
      return _prfileItems
          .where((item) => item.text != 'Добавить ребёнка')
          .toList();
    }

    return _prfileItems;
  }

  // Метод для программного скрытия элемента "Добавить ребёнка"
  static Future<void> hideAddChildItem() async {
    final store = getIt<Store>();
    await store.closedAboutChildren();
  }

  final List<profile_item_model.ProfileItem> _prfileItems = [
    profile_item_model.ProfileItem(
      icon: 'assets/icons/user.svg',
      text: 'Личная информация',
      onTap: (BuildContext context) {
        context.navigateTo(const PersonalInformationRoute());
      },
    ),
    profile_item_model.ProfileItem(
      icon: 'assets/icons/user_plus.svg',
      text: 'Добавить ребёнка',
      onTap: (BuildContext context) {
        context.navigateTo(const ChildrensRoute());
      },
    ),
    profile_item_model.ProfileItem(
      icon: 'assets/icons/box.svg',
      text: 'Все заказы',
      onTap: (BuildContext context) {
        context.navigateTo(MyOrdersRoute());
      },
    ),
    profile_item_model.ProfileItem(
      icon: 'assets/icons/star.svg',
      text: 'Оставить отзыв',
      onTap: (BuildContext context) {
        context.navigateTo(MyOrdersRoute(
          title: 'Оставить отзыв',
        ));
      },
    ),
    profile_item_model.ProfileItem(
      icon: 'assets/icons/cross.svg',
      text: 'Удалить аккаунт',
      onTap: (BuildContext context) {
        context.navigateTo(const DeleteAccountRoute());
      },
    ),
  ];
}
