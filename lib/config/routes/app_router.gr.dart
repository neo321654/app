// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter();

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutDeliveryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutDeliveryPage(),
      );
    },
    AboutPaymentsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutPaymentsPage(),
      );
    },
    AboutPoliticsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutPoliticsPage(),
      );
    },
    ActionRoute.name: (routeData) {
      final args = routeData.argsAs<ActionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ActionPage(
          key: args.key,
          title: args.title,
          actionId: args.actionId,
        ),
      );
    },
    AddChildRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddChildPage(),
      );
    },
    AddressManualyRoute.name: (routeData) {
      final args = routeData.argsAs<AddressManualyRouteArgs>(
          orElse: () => const AddressManualyRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddressManualyPage(
          key: args.key,
          mode: args.mode,
        ),
      );
    },
    AddressMapRoute.name: (routeData) {
      final args = routeData.argsAs<AddressMapRouteArgs>(
          orElse: () => const AddressMapRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddressMapPage(
          key: args.key,
          pageRoute: args.pageRoute,
          mode: args.mode,
          address: args.address,
        ),
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthPage(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    BaseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BasePage(),
      );
    },
    BasketNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BasketNavigationPage(),
      );
    },
    BasketRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BasketPage(),
      );
    },
    CatalogRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CatalogRouteArgs>(
          orElse: () => CatalogRouteArgs(
              selectedCategoryId: pathParams.optInt('categoryId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CatalogPage(
          key: args.key,
          selectedCategoryId: args.selectedCategoryId,
        ),
      );
    },
    ChildrensRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChildrensPage(),
      );
    },
    CityManualyRoute.name: (routeData) {
      final args = routeData.argsAs<CityManualyRouteArgs>(
          orElse: () => const CityManualyRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CityManualyPage(
          key: args.key,
          mode: args.mode,
        ),
      );
    },
    CollectionRoute.name: (routeData) {
      final args = routeData.argsAs<CollectionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CollectionPage(
          key: args.key,
          collection: args.collection,
        ),
      );
    },
    CreateOrderRoute.name: (routeData) {
      final args = routeData.argsAs<CreateOrderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CreateOrderPage(
          key: args.key,
          basket: args.basket,
        ),
      );
    },
    CustonWebViewRoute.name: (routeData) {
      final args = routeData.argsAs<CustonWebViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CustonWebViewPage(
          key: args.key,
          url: args.url,
          onPageFinished: args.onPageFinished,
          title: args.title,
        ),
      );
    },
    DeleteAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DeleteAccountPage(),
      );
    },
    EditAddressRoute.name: (routeData) {
      final args = routeData.argsAs<EditAddressRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditAddressPage(
          key: args.key,
          address: args.address,
        ),
      );
    },
    EmptyNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EmptyNavigationPage(),
      );
    },
    FiltersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FiltersPage(),
      );
    },
    HalfPizzaRoute.name: (routeData) {
      final args = routeData.argsAs<HalfPizzaRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HalfPizzaPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    HomeNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeNavigationPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LoyalEntityRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoyalEntityPage(),
      );
    },
    LoyaltyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoyaltyPage(),
      );
    },
    MoreNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MoreNavigationPage(),
      );
    },
    MoreRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MorePage(),
      );
    },
    MyAddressesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyAddressesPage(),
      );
    },
    MyOrdersRoute.name: (routeData) {
      final args = routeData.argsAs<MyOrdersRouteArgs>(
          orElse: () => const MyOrdersRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyOrdersPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    NotificationsSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsSettingsPage(),
      );
    },
    OrderRoute.name: (routeData) {
      final args = routeData.argsAs<OrderRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderPage(
          key: args.key,
          orderId: args.orderId,
          isNew: args.isNew,
        ),
      );
    },
    PersonalInformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonalInformationPage(),
      );
    },
    ProductRoute.name: (routeData) {
      final args = routeData.argsAs<ProductRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductPage(
          key: args.key,
          product: args.product,
          productCardState: args.productCardState,
        ),
      );
    },
    ProfileNavigationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileNavigationPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    SearchRoute.name: (routeData) {
      final args = routeData.argsAs<SearchRouteArgs>(
          orElse: () => const SearchRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SearchPage(
          key: args.key,
          startSearch: args.startSearch,
        ),
      );
    },
    ShopsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ShopsPage(),
      );
    },
  };
}

/// generated route for
/// [AboutDeliveryPage]
class AboutDeliveryRoute extends PageRouteInfo<void> {
  const AboutDeliveryRoute({List<PageRouteInfo>? children})
      : super(
          AboutDeliveryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutDeliveryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AboutPaymentsPage]
class AboutPaymentsRoute extends PageRouteInfo<void> {
  const AboutPaymentsRoute({List<PageRouteInfo>? children})
      : super(
          AboutPaymentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutPaymentsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AboutPoliticsPage]
class AboutPoliticsRoute extends PageRouteInfo<void> {
  const AboutPoliticsRoute({List<PageRouteInfo>? children})
      : super(
          AboutPoliticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutPoliticsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ActionPage]
class ActionRoute extends PageRouteInfo<ActionRouteArgs> {
  ActionRoute({
    Key? key,
    required String title,
    required int actionId,
    List<PageRouteInfo>? children,
  }) : super(
          ActionRoute.name,
          args: ActionRouteArgs(
            key: key,
            title: title,
            actionId: actionId,
          ),
          initialChildren: children,
        );

  static const String name = 'ActionRoute';

  static const PageInfo<ActionRouteArgs> page = PageInfo<ActionRouteArgs>(name);
}

class ActionRouteArgs {
  const ActionRouteArgs({
    this.key,
    required this.title,
    required this.actionId,
  });

  final Key? key;

  final String title;

  final int actionId;

  @override
  String toString() {
    return 'ActionRouteArgs{key: $key, title: $title, actionId: $actionId}';
  }
}

/// generated route for
/// [AddChildPage]
class AddChildRoute extends PageRouteInfo<void> {
  const AddChildRoute({List<PageRouteInfo>? children})
      : super(
          AddChildRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddChildRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AddressManualyPage]
class AddressManualyRoute extends PageRouteInfo<AddressManualyRouteArgs> {
  AddressManualyRoute({
    Key? key,
    String mode = '',
    List<PageRouteInfo>? children,
  }) : super(
          AddressManualyRoute.name,
          args: AddressManualyRouteArgs(
            key: key,
            mode: mode,
          ),
          initialChildren: children,
        );

  static const String name = 'AddressManualyRoute';

  static const PageInfo<AddressManualyRouteArgs> page =
      PageInfo<AddressManualyRouteArgs>(name);
}

class AddressManualyRouteArgs {
  const AddressManualyRouteArgs({
    this.key,
    this.mode = '',
  });

  final Key? key;

  final String mode;

  @override
  String toString() {
    return 'AddressManualyRouteArgs{key: $key, mode: $mode}';
  }
}

/// generated route for
/// [AddressMapPage]
class AddressMapRoute extends PageRouteInfo<AddressMapRouteArgs> {
  AddressMapRoute({
    Key? key,
    PageInfo<void>? pageRoute,
    String mode = '',
    String? address,
    List<PageRouteInfo>? children,
  }) : super(
          AddressMapRoute.name,
          args: AddressMapRouteArgs(
            key: key,
            pageRoute: pageRoute,
            mode: mode,
            address: address,
          ),
          initialChildren: children,
        );

  static const String name = 'AddressMapRoute';

  static const PageInfo<AddressMapRouteArgs> page =
      PageInfo<AddressMapRouteArgs>(name);
}

class AddressMapRouteArgs {
  const AddressMapRouteArgs({
    this.key,
    this.pageRoute,
    this.mode = '',
    this.address,
  });

  final Key? key;

  final PageInfo<void>? pageRoute;

  final String mode;

  final String? address;

  @override
  String toString() {
    return 'AddressMapRouteArgs{key: $key, pageRoute: $pageRoute, mode: $mode, address: $address}';
  }
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    Key? key,
    void Function(bool)? onResult,
    List<PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<AuthRouteArgs> page = PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    this.onResult,
  });

  final Key? key;

  final void Function(bool)? onResult;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [BasePage]
class BaseRoute extends PageRouteInfo<void> {
  const BaseRoute({List<PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BasketNavigationPage]
class BasketNavigationRoute extends PageRouteInfo<void> {
  const BasketNavigationRoute({List<PageRouteInfo>? children})
      : super(
          BasketNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'BasketNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BasketPage]
class BasketRoute extends PageRouteInfo<void> {
  const BasketRoute({List<PageRouteInfo>? children})
      : super(
          BasketRoute.name,
          initialChildren: children,
        );

  static const String name = 'BasketRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CatalogPage]
class CatalogRoute extends PageRouteInfo<CatalogRouteArgs> {
  CatalogRoute({
    Key? key,
    int? selectedCategoryId,
    List<PageRouteInfo>? children,
  }) : super(
          CatalogRoute.name,
          args: CatalogRouteArgs(
            key: key,
            selectedCategoryId: selectedCategoryId,
          ),
          rawPathParams: {'categoryId': selectedCategoryId},
          initialChildren: children,
        );

  static const String name = 'CatalogRoute';

  static const PageInfo<CatalogRouteArgs> page =
      PageInfo<CatalogRouteArgs>(name);
}

class CatalogRouteArgs {
  const CatalogRouteArgs({
    this.key,
    this.selectedCategoryId,
  });

  final Key? key;

  final int? selectedCategoryId;

  @override
  String toString() {
    return 'CatalogRouteArgs{key: $key, selectedCategoryId: $selectedCategoryId}';
  }
}

/// generated route for
/// [ChildrensPage]
class ChildrensRoute extends PageRouteInfo<void> {
  const ChildrensRoute({List<PageRouteInfo>? children})
      : super(
          ChildrensRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChildrensRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CityManualyPage]
class CityManualyRoute extends PageRouteInfo<CityManualyRouteArgs> {
  CityManualyRoute({
    Key? key,
    String mode = '',
    List<PageRouteInfo>? children,
  }) : super(
          CityManualyRoute.name,
          args: CityManualyRouteArgs(
            key: key,
            mode: mode,
          ),
          initialChildren: children,
        );

  static const String name = 'CityManualyRoute';

  static const PageInfo<CityManualyRouteArgs> page =
      PageInfo<CityManualyRouteArgs>(name);
}

class CityManualyRouteArgs {
  const CityManualyRouteArgs({
    this.key,
    this.mode = '',
  });

  final Key? key;

  final String mode;

  @override
  String toString() {
    return 'CityManualyRouteArgs{key: $key, mode: $mode}';
  }
}

/// generated route for
/// [CollectionPage]
class CollectionRoute extends PageRouteInfo<CollectionRouteArgs> {
  CollectionRoute({
    Key? key,
    required CollectionEntity collection,
    List<PageRouteInfo>? children,
  }) : super(
          CollectionRoute.name,
          args: CollectionRouteArgs(
            key: key,
            collection: collection,
          ),
          initialChildren: children,
        );

  static const String name = 'CollectionRoute';

  static const PageInfo<CollectionRouteArgs> page =
      PageInfo<CollectionRouteArgs>(name);
}

class CollectionRouteArgs {
  const CollectionRouteArgs({
    this.key,
    required this.collection,
  });

  final Key? key;

  final CollectionEntity collection;

  @override
  String toString() {
    return 'CollectionRouteArgs{key: $key, collection: $collection}';
  }
}

/// generated route for
/// [CreateOrderPage]
class CreateOrderRoute extends PageRouteInfo<CreateOrderRouteArgs> {
  CreateOrderRoute({
    Key? key,
    required BasketEntity basket,
    List<PageRouteInfo>? children,
  }) : super(
          CreateOrderRoute.name,
          args: CreateOrderRouteArgs(
            key: key,
            basket: basket,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateOrderRoute';

  static const PageInfo<CreateOrderRouteArgs> page =
      PageInfo<CreateOrderRouteArgs>(name);
}

class CreateOrderRouteArgs {
  const CreateOrderRouteArgs({
    this.key,
    required this.basket,
  });

  final Key? key;

  final BasketEntity basket;

  @override
  String toString() {
    return 'CreateOrderRouteArgs{key: $key, basket: $basket}';
  }
}

/// generated route for
/// [CustonWebViewPage]
class CustonWebViewRoute extends PageRouteInfo<CustonWebViewRouteArgs> {
  CustonWebViewRoute({
    Key? key,
    required String url,
    void Function(String)? onPageFinished,
    String? title,
    List<PageRouteInfo>? children,
  }) : super(
          CustonWebViewRoute.name,
          args: CustonWebViewRouteArgs(
            key: key,
            url: url,
            onPageFinished: onPageFinished,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CustonWebViewRoute';

  static const PageInfo<CustonWebViewRouteArgs> page =
      PageInfo<CustonWebViewRouteArgs>(name);
}

class CustonWebViewRouteArgs {
  const CustonWebViewRouteArgs({
    this.key,
    required this.url,
    this.onPageFinished,
    this.title,
  });

  final Key? key;

  final String url;

  final void Function(String)? onPageFinished;

  final String? title;

  @override
  String toString() {
    return 'CustonWebViewRouteArgs{key: $key, url: $url, onPageFinished: $onPageFinished, title: $title}';
  }
}

/// generated route for
/// [DeleteAccountPage]
class DeleteAccountRoute extends PageRouteInfo<void> {
  const DeleteAccountRoute({List<PageRouteInfo>? children})
      : super(
          DeleteAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeleteAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditAddressPage]
class EditAddressRoute extends PageRouteInfo<EditAddressRouteArgs> {
  EditAddressRoute({
    Key? key,
    required AddressEntity address,
    List<PageRouteInfo>? children,
  }) : super(
          EditAddressRoute.name,
          args: EditAddressRouteArgs(
            key: key,
            address: address,
          ),
          initialChildren: children,
        );

  static const String name = 'EditAddressRoute';

  static const PageInfo<EditAddressRouteArgs> page =
      PageInfo<EditAddressRouteArgs>(name);
}

class EditAddressRouteArgs {
  const EditAddressRouteArgs({
    this.key,
    required this.address,
  });

  final Key? key;

  final AddressEntity address;

  @override
  String toString() {
    return 'EditAddressRouteArgs{key: $key, address: $address}';
  }
}

/// generated route for
/// [EmptyNavigationPage]
class EmptyNavigationRoute extends PageRouteInfo<void> {
  const EmptyNavigationRoute({List<PageRouteInfo>? children})
      : super(
          EmptyNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FiltersPage]
class FiltersRoute extends PageRouteInfo<void> {
  const FiltersRoute({List<PageRouteInfo>? children})
      : super(
          FiltersRoute.name,
          initialChildren: children,
        );

  static const String name = 'FiltersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HalfPizzaPage]
class HalfPizzaRoute extends PageRouteInfo<HalfPizzaRouteArgs> {
  HalfPizzaRoute({
    Key? key,
    required ProductEntity product,
    List<PageRouteInfo>? children,
  }) : super(
          HalfPizzaRoute.name,
          args: HalfPizzaRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'HalfPizzaRoute';

  static const PageInfo<HalfPizzaRouteArgs> page =
      PageInfo<HalfPizzaRouteArgs>(name);
}

class HalfPizzaRouteArgs {
  const HalfPizzaRouteArgs({
    this.key,
    required this.product,
  });

  final Key? key;

  final ProductEntity product;

  @override
  String toString() {
    return 'HalfPizzaRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [HomeNavigationPage]
class HomeNavigationRoute extends PageRouteInfo<void> {
  const HomeNavigationRoute({List<PageRouteInfo>? children})
      : super(
          HomeNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoyalEntityPage]
class LoyalEntityRoute extends PageRouteInfo<void> {
  const LoyalEntityRoute({List<PageRouteInfo>? children})
      : super(
          LoyalEntityRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoyalEntityRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoyaltyPage]
class LoyaltyRoute extends PageRouteInfo<void> {
  const LoyaltyRoute({List<PageRouteInfo>? children})
      : super(
          LoyaltyRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoyaltyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MoreNavigationPage]
class MoreNavigationRoute extends PageRouteInfo<void> {
  const MoreNavigationRoute({List<PageRouteInfo>? children})
      : super(
          MoreNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MorePage]
class MoreRoute extends PageRouteInfo<void> {
  const MoreRoute({List<PageRouteInfo>? children})
      : super(
          MoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyAddressesPage]
class MyAddressesRoute extends PageRouteInfo<void> {
  const MyAddressesRoute({List<PageRouteInfo>? children})
      : super(
          MyAddressesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAddressesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyOrdersPage]
class MyOrdersRoute extends PageRouteInfo<MyOrdersRouteArgs> {
  MyOrdersRoute({
    Key? key,
    String? title,
    List<PageRouteInfo>? children,
  }) : super(
          MyOrdersRoute.name,
          args: MyOrdersRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'MyOrdersRoute';

  static const PageInfo<MyOrdersRouteArgs> page =
      PageInfo<MyOrdersRouteArgs>(name);
}

class MyOrdersRouteArgs {
  const MyOrdersRouteArgs({
    this.key,
    this.title,
  });

  final Key? key;

  final String? title;

  @override
  String toString() {
    return 'MyOrdersRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [NotificationsSettingsPage]
class NotificationsSettingsRoute extends PageRouteInfo<void> {
  const NotificationsSettingsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderPage]
class OrderRoute extends PageRouteInfo<OrderRouteArgs> {
  OrderRoute({
    Key? key,
    required int orderId,
    bool isNew = false,
    List<PageRouteInfo>? children,
  }) : super(
          OrderRoute.name,
          args: OrderRouteArgs(
            key: key,
            orderId: orderId,
            isNew: isNew,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const PageInfo<OrderRouteArgs> page = PageInfo<OrderRouteArgs>(name);
}

class OrderRouteArgs {
  const OrderRouteArgs({
    this.key,
    required this.orderId,
    this.isNew = false,
  });

  final Key? key;

  final int orderId;

  final bool isNew;

  @override
  String toString() {
    return 'OrderRouteArgs{key: $key, orderId: $orderId, isNew: $isNew}';
  }
}

/// generated route for
/// [PersonalInformationPage]
class PersonalInformationRoute extends PageRouteInfo<void> {
  const PersonalInformationRoute({List<PageRouteInfo>? children})
      : super(
          PersonalInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalInformationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductPage]
class ProductRoute extends PageRouteInfo<ProductRouteArgs> {
  ProductRoute({
    Key? key,
    required ProductEntity product,
    ProductCardStateCubit? productCardState,
    List<PageRouteInfo>? children,
  }) : super(
          ProductRoute.name,
          args: ProductRouteArgs(
            key: key,
            product: product,
            productCardState: productCardState,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRoute';

  static const PageInfo<ProductRouteArgs> page =
      PageInfo<ProductRouteArgs>(name);
}

class ProductRouteArgs {
  const ProductRouteArgs({
    this.key,
    required this.product,
    this.productCardState,
  });

  final Key? key;

  final ProductEntity product;

  final ProductCardStateCubit? productCardState;

  @override
  String toString() {
    return 'ProductRouteArgs{key: $key, product: $product, productCardState: $productCardState}';
  }
}

/// generated route for
/// [ProfileNavigationPage]
class ProfileNavigationRoute extends PageRouteInfo<void> {
  const ProfileNavigationRoute({List<PageRouteInfo>? children})
      : super(
          ProfileNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileNavigationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<SearchRouteArgs> {
  SearchRoute({
    Key? key,
    bool startSearch = false,
    List<PageRouteInfo>? children,
  }) : super(
          SearchRoute.name,
          args: SearchRouteArgs(
            key: key,
            startSearch: startSearch,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static const PageInfo<SearchRouteArgs> page = PageInfo<SearchRouteArgs>(name);
}

class SearchRouteArgs {
  const SearchRouteArgs({
    this.key,
    this.startSearch = false,
  });

  final Key? key;

  final bool startSearch;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key, startSearch: $startSearch}';
  }
}

/// generated route for
/// [ShopsPage]
class ShopsRoute extends PageRouteInfo<void> {
  const ShopsRoute({List<PageRouteInfo>? children})
      : super(
          ShopsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ShopsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
