import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:monobox/features/address_setup/domain/entities/address_entity.dart';
import 'package:monobox/features/home/presentation/bloc/product_card_state/product_card_state_cubit.dart';
import 'package:monobox/features/home/presentation/pages/action_page.dart';
import 'package:monobox/features/home/presentation/pages/half_pizza_page.dart';
import 'package:monobox/features/more/presentation/pages/about_politics_page.dart';

import 'package:monobox/features/profile/presentation/pages/edit_address_page.dart';
import 'package:monobox/features/profile/presentation/pages/loyal_entity_page.dart';

import '../../features/address_setup/presentation/pages/address_manualy_page.dart';
import '../../features/address_setup/presentation/pages/city_manualy_page.dart';
import '../../features/address_setup/presentation/pages/address_map/address_map_page.dart';
import '../../features/auth/presentation/bloc/auth/auth_bloc.dart';
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/basket/domain/entities/basket_entity.dart';
import '../../features/basket/presentation/pages/basket_navigation_page.dart';
import '../../features/basket/presentation/pages/basket_page.dart';
import '../../features/home/domain/entities/collection_entity.dart';
import '../../features/home/domain/entities/product_entity.dart';
import '../../features/home/presentation/pages/base_page.dart';
import '../../features/home/presentation/pages/catalog_page.dart';
import '../../features/home/presentation/pages/collection_page.dart';
import '../../features/home/presentation/pages/custom_web_view_page.dart';
import '../../features/home/presentation/pages/empty_navigation_page.dart';
import '../../features/home/presentation/pages/filters_page.dart';
import '../../features/home/presentation/pages/home_navigation_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/product_page.dart';
import '../../features/home/presentation/pages/search_page.dart';
import '../../features/home/presentation/widgets/bottom_sheet_container.dart';
import '../../features/more/presentation/pages/about_delivery_page.dart';
import '../../features/more/presentation/pages/about_payments_page.dart';
import '../../features/more/presentation/pages/more_navigation_page.dart';
import '../../features/more/presentation/pages/more_page/more_page.dart';
import '../../features/more/presentation/pages/shops_page.dart';
import '../../features/order/presentation/pages/create_order_page.dart';
import '../../features/order/presentation/pages/order_page.dart';
import '../../features/profile/presentation/pages/add_child_page.dart';
import '../../features/profile/presentation/pages/childrens_page.dart';
import '../../features/profile/presentation/pages/delete_account_page.dart';
import '../../features/profile/presentation/pages/loyalty_page.dart';
import '../../features/profile/presentation/pages/my_addresses_page.dart';
import '../../features/profile/presentation/pages/my_orders_page.dart';
import '../../features/profile/presentation/pages/notifications_settings_page.dart';
import '../../features/profile/presentation/pages/personal_information_page.dart';
import '../../features/profile/presentation/pages/profile_navigation_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../injection_container.dart';
import '../themes/colors.dart';
import '../themes/styles.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          //initial: !getIt<AuthBloc>().state.isFirstEntry,
          initial: !getIt<AuthBloc>().store.isFirstEntry() &&
              getIt<AuthBloc>().store.cityId != null,
          page: BaseRoute.page,
          children: [
            AutoRoute(
              page: HomeNavigationRoute.page,
              //maintainState: false,
              children: [
                AutoRoute(
                  page: HomeRoute.page,
                  initial: true,
                ),
                AutoRoute(page: CatalogRoute.page),
                AutoRoute(page: CollectionRoute.page),
                //AutoRoute(page: ProductRoute.page),
                RedirectRoute(path: '*', redirectTo: ''),
                AutoRoute(page: SearchRoute.page),
                CustomRoute(
                  page: ProductRoute.page,
                  customRouteBuilder: modalSheetBuilder2,
                ),
                CustomRoute(
                  page: HalfPizzaRoute.page,
                ),
                CustomRoute(
                  page: FiltersRoute.page,
                  customRouteBuilder: modalSheetBuilder3,
                  //guards: [AuthGuard()],
                ),
                CustomRoute(
                  page: MyAddressesRoute.page,
                  customRouteBuilder: modalSheetBuilder3,
                  guards: [AuthGuard()],
                ),
                CustomRoute(
                  page: ActionRoute.page,
                  customRouteBuilder: modalSheetBuilder3,
                ),
                AutoRoute(
                  page: EditAddressRoute.page,
                  guards: [AuthGuard()],
                ),
              ],
            ),
            AutoRoute(
              page: BasketNavigationRoute.page,
              path: 'basket',
              children: [
                AutoRoute(
                  path: '',
                  page: BasketRoute.page,
                  initial: true,
                ),
                AutoRoute(
                  page: CreateOrderRoute.page,
                  guards: [AuthGuard()],
                ),
                AutoRoute(page: CustonWebViewRoute.page),
                AutoRoute(
                  page: EditAddressRoute.page,
                  guards: [AuthGuard()],
                ),
              ],
            ),
            AutoRoute(
              path: 'profile',
              page: ProfileNavigationRoute.page,
              children: [
                AutoRoute(
                  page: ProfileRoute.page,
                  initial: true,
                  //guards: [AuthGuard()],
                ),
                AutoRoute(
                  page: PersonalInformationRoute.page,
                  guards: [AuthGuard()],
                ),
                AutoRoute(
                  page: ChildrensRoute.page,
                  guards: [AuthGuard()],
                ),
                AutoRoute(
                  page: AddChildRoute.page,
                  guards: [AuthGuard()],
                ),
                AutoRoute(
                  page: OrderRoute.page,
                  guards: [AuthGuard()],
                ),
                AutoRoute(
                  page: MyOrdersRoute.page,
                  guards: [AuthGuard()],
                ),
                CustomRoute(
                  page: MyAddressesRoute.page,
                  customRouteBuilder: modalSheetBuilder3,
                  guards: [AuthGuard()],
                ),
                AutoRoute(
                  page: LoyaltyRoute.page,
                  guards: [AuthGuard()],
                ),
                AutoRoute(
                  page: DeleteAccountRoute.page,
                  guards: [AuthGuard()],
                ),
                AutoRoute(
                  page: EditAddressRoute.page,
                  guards: [AuthGuard()],
                ),
                AutoRoute(
                  page: LoyalEntityRoute.page,
                  guards: [AuthGuard()],
                ),
                //AutoRoute(page: AuthRoute.page, initial: true),
              ],
            ),
            AutoRoute(
              page: MoreNavigationRoute.page,
              children: [
                AutoRoute(page: MoreRoute.page, initial: true),
                AutoRoute(page: AuthRoute.page),
                AutoRoute(page: NotificationsSettingsRoute.page),
                AutoRoute(page: ShopsRoute.page),
                AutoRoute(page: AboutDeliveryRoute.page),
                AutoRoute(page: AboutPaymentsRoute.page),
                AutoRoute(page: AboutPoliticsRoute.page),
                AutoRoute(page: CustonWebViewRoute.page),
              ],
            ),
          ],
        ),
        CustomRoute(
          page: EmptyNavigationRoute.page,
          customRouteBuilder: modalSheetBuilder,
          children: [
            AutoRoute(page: ProductRoute.page, initial: true),
          ],
        ),
        AutoRoute(
          page: AddressMapRoute.page,
          //initial: getIt<AuthBloc>().state.isFirstEntry,
          initial: getIt<AuthBloc>().store.isFirstEntry() ||
              getIt<AuthBloc>().store.cityId == null,
        ),
        AutoRoute(
          page: AuthRoute.page,
          //initial: true,
        ),
        AutoRoute(page: AddressManualyRoute.page),
        AutoRoute(page: CityManualyRoute.page),
      ];
}

Route<T> modalSheetBuilder<T>(
    BuildContext context, Widget child, AutoRoutePage<T> page) {
  return ModalBottomSheetRoute(
    settings: page,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(
          AppStyles.radiusBlock,
        ),
      ),
    ),
    builder: (BuildContext context) {
      return BottomSheetContainer(
        child: child,
      );
    },
    //expanded: true,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}

Route<T> modalSheetBuilder2<T>(
    BuildContext context, Widget child, AutoRoutePage<T> page) {
  return ModalBottomSheetRoute(
    settings: page,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(
          AppStyles.radiusBlock,
        ),
      ),
    ),
    builder: (BuildContext context) {
      return BottomSheetContainer(
        mode: 'noheader',
        child: child,
      );
    },
    //expanded: true,

    isScrollControlled: true,
    backgroundColor: AppColors.white,
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}

Route<T> modalSheetBuilder3<T>(
    BuildContext context, Widget child, AutoRoutePage<T> page) {
  return ModalBottomSheetRoute(
    settings: page,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(
          AppStyles.radiusBlock,
        ),
      ),
    ),
    builder: (BuildContext context) {
      return BottomSheetContainer(
        mode: 'autosize',
        child: child,
      );
    },
    //expanded: true,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (getIt<AuthBloc>().state == const AuthState.authenticated()) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(AuthRoute(
        onResult: (isLogin) => resolver.next(isLogin),
      ));
    }
  }
}
