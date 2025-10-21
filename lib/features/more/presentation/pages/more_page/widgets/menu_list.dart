import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monobox/features/more/presentation/bloc/menu_bloc.dart';

import '../../../../../../config/routes/app_router.dart';
import '../../../../../profile/presentation/widgets/profile_item.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        if (state is MenuLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is MenuError) {
          return const Center(child: Text('Error'));
        }
        if (state is MenuDone && state.menuResponse?.mobile?.isNotEmpty == true) {
          final menuItems = state.menuResponse!.mobile!.first.links;
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ProfileItem(
                icon: menuItems[index].icon ?? '',
                text: menuItems[index].title,
                onTap: (BuildContext context) {
                  _handleMenuNavigation(context, menuItems[index].title);
                },
              );
            },
            separatorBuilder: (context, index) {
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
            itemCount: menuItems.length,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _handleMenuNavigation(BuildContext context, String? path) {
    switch (path) {
      case 'Где рестораны':
        context.navigateTo(const ShopsRoute());
        break;
      case 'О доставке':
        context.navigateTo(const AboutDeliveryRoute());
        break;
      case 'Об оплате':
        context.navigateTo(const AboutPaymentsRoute());
        break;
      case 'Уведомления':
        context.navigateTo(const NotificationsSettingsRoute());
        break;
      case 'Политика и соглашение':
        context.navigateTo(const AboutPoliticsRoute());
        break;
    }
  }
}
