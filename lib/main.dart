import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:monobox/features/basket/domain/entities/basket_entity.dart';
import 'package:monobox/features/basket/domain/entities/basket_info_request_entity.dart';
import 'package:monobox/features/basket/domain/entities/basket_modifire_entity.dart';
import 'package:monobox/features/basket/presentation/bloc/basket_info/basket_info_bloc.dart';
import 'package:monobox/features/order/presentation/bloc/deliveries/deliveries_bloc.dart';
import 'config/routes/app_router.dart';
import 'config/themes/app_themes.dart';
import 'config/themes/colors.dart';
import 'core/firebase/app_firebase.dart';
// ignore: unused_import
import 'features/address_setup/presentation/bloc/create_address/create_address_bloc.dart';
import 'features/address_setup/presentation/bloc/geolocate_address/geolocate_address_bloc.dart';
import 'features/address_setup/presentation/bloc/user_address/user_address_bloc.dart';
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'features/basket/data/data_sources/locale/basket_locale.dart';
import 'features/basket/data/models/basket_dto.dart';
import 'features/basket/data/models/basket_offer_dto.dart';
import 'features/basket/presentation/bloc/basket/basket_bloc.dart';
import 'features/home/data/models/product_dto.dart';
import 'features/home/data/models/product_option_dto.dart';
import 'features/home/presentation/bloc/cubit/applied_filter_state_cubit.dart';
import 'features/home/presentation/bloc/cubit/search_cubit.dart';
import 'features/home/presentation/bloc/filials/filials_bloc.dart';
import 'features/home/presentation/bloc/cities/cities_bloc.dart'
    as filial_cities_bloc;
import 'features/home/presentation/bloc/gifts_scale/gifts_scale_bloc.dart';
import 'features/home/presentation/bloc/products/products_bloc.dart';
import 'features/home/presentation/bloc/settings/settings_bloc.dart';
import 'features/home/presentation/bloc/tags/tags_bloc.dart';
import 'features/more/presentation/bloc/menu_bloc.dart';
import 'features/order/presentation/bloc/create_order_state_cubit/create_order_state_cubit.dart';
import 'features/profile/presentation/bloc/loyalty/loyalty_bloc.dart';
import 'features/profile/presentation/bloc/notification/notification_settings_bloc.dart';
import 'features/profile/presentation/bloc/profile/profile_cubit.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await setupDependencies();
  await _initHive();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.white,
    statusBarColor: AppColors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   systemNavigationBarColor: AppColors.white,
  //   // statusBarColor: Colors.transparent,
  //   // statusBarIconBrightness: Brightness.dark,
  // ));

  await AppFirebase().init();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };
  // // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  await FastCachedImageConfig.init(clearCacheAfter: const Duration(days: 365));

  runApp(MyApp());
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BasketDtoAdapter());
  Hive.registerAdapter(BasketOfferDtoAdapter());
  Hive.registerAdapter(ProductOptionDtoAdapter());
  Hive.registerAdapter(ProductDtoAdapter());
  await getIt<BasketLocale>().initBox();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MainWidget(appRouter: _appRouter);
    // return ScreenUtilInit(
    //   designSize: const Size(360, 690),
    //   ensureScreenSize: true,
    //   // minTextAdapt: true,
    //   // splitScreenMode: true,

    //   builder: (_, child) {
    //     return MainWidget(appRouter: _appRouter);
    //   },
    // );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
    required AppRouter appRouter,
  }) : _appRouter = appRouter;

  final AppRouter _appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<FilialsBloc>()
            ..add(
              const FilialsEvent.getFilials(),
            ),
        ),
        BlocProvider.value(
          value: getIt<filial_cities_bloc.CitiesBloc>()
            ..add(
              const filial_cities_bloc.CitiesEvent.getCities(),
            ),
        ),
        BlocProvider.value(value: getIt<AuthBloc>()..add(AppStarted())),
        BlocProvider.value(value: getIt<GeolocateAddressBloc>()),
        //BlocProvider.value(value: getIt<BasketBloc>()..add(LoadBasket())),
        BlocProvider.value(value: getIt<BasketBloc>()),
        BlocProvider.value(value: getIt<ProfileCubit>()),
        BlocProvider.value(value: getIt<UserAddressBloc>()),
        BlocProvider.value(
          value: getIt<TagsBloc>()
            ..add(
              const TagsEvent.getTags(),
            ),
        ),
        BlocProvider.value(value: getIt<AppliedFilterStateCubit>()),
        BlocProvider.value(value: getIt<ProductsBloc>()),
        BlocProvider.value(
          value: getIt<SettingsBloc>()..add(const SettingsEvent.getSettings()),
        ),
        BlocProvider.value(value: getIt<SearchCubit>()),
        BlocProvider.value(value: getIt<LoyaltyBloc>()),
        BlocProvider.value(
          value: getIt<GiftsScaleBloc>()
            ..add(
              const GiftsScaleEvent.getGiftsScale(),
            ),
        ),
        BlocProvider.value(value: getIt<BasketInfoBloc>()),
        BlocProvider.value(
          value: getIt<DeliveryBloc>()..add(const GetDeliveries()),
        ),
        BlocProvider(
          create: (context) => getIt<MenuBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state != const AuthState.authenticated()) {
                getIt<ProfileCubit>().clear();
              }

              if (state == const AuthState.authenticated()) {
                getIt<UserAddressBloc>().add(
                  const UserAddressEvent.getAddresses(),
                );
                getIt<NotificationSettingsBloc>().add(
                  const NotificationSettingsEvent.getNotificationSettings(),
                );
                getIt<LoyaltyBloc>().add(
                  const LoyaltyEvent.getLoyaltyInfo(),
                );
                // getIt<GiftsScaleBloc>().add(
                //   const GiftsScaleEvent.getGiftsScale(),
                // );
              }
            },
          ),
          BlocListener<DeliveryBloc, DeliveriesState>(
            listener: (context, state) {
              print('MAIN - DELIVERY BLOC STATE: ${state.runtimeType}');
              if (state is DeliveriesDone) {
                print('MAIN - DELIVERIES DONE, LOADING BASKET');
                getIt<BasketBloc>().add(LoadBasket());
              }
            },
          ),
          BlocListener<BasketBloc, BasketState>(
            listener: (context, state) {
              if (state is BasketLoaded) {
                final BasketEntity basket = state.basket;
                int? deliveryId;

                if (getIt<CreateOrderStateCubit>().state.delivery == null) {
                  // Ищем доставку (не pickup) по умолчанию
                  final deliveryOption =
                      getIt<DeliveryBloc>().state.deliveries?.firstWhere(
                            (delivery) => delivery.type == 'delivery',
                            orElse: () =>
                                getIt<DeliveryBloc>().state.deliveries!.first,
                          );
                  deliveryId = deliveryOption?.id;
                } else {
                  if (getIt<DeliveryBloc>().state.deliveries?.isNotEmpty ==
                      true) {
                    //deliveryId = getIt<DeliveryBloc>().state.deliveries!.indexOf(getIt<CreateOrderStateCubit>().state.delivery!);
                    deliveryId =
                        getIt<CreateOrderStateCubit>().state.delivery!.id;
                  }
                }

                print('MAIN - DELIVERY ID: $deliveryId');
                print(
                    'MAIN - SELECTED DELIVERY: ${getIt<CreateOrderStateCubit>().state.delivery?.name} (TYPE: ${getIt<CreateOrderStateCubit>().state.delivery?.type}, ID: ${getIt<CreateOrderStateCubit>().state.delivery?.id})');
                print(
                    'MAIN - SELECTED ADDRESS: ${getIt<CreateOrderStateCubit>().state.deliveryAddress?.address} (ID: ${getIt<CreateOrderStateCubit>().state.deliveryAddress?.id})');
                print(
                    'MAIN - AVAILABLE DELIVERIES: ${getIt<DeliveryBloc>().state.deliveries?.map((d) => '${d.id}:${d.name}(${d.type})').join(', ')}');

                // ВАЖНО: вызываем пересчет корзины только если адрес уже установлен
                if (getIt<CreateOrderStateCubit>().state.deliveryAddress !=
                    null) {
                  print(
                      'MAIN - CALLING BASKET INFO BLOC with deliveryId: $deliveryId and addressId: ${getIt<CreateOrderStateCubit>().state.deliveryAddress?.id}');
                  getIt<BasketInfoBloc>().add(
                    BasketInfoEvent.getBasketInfo(
                      [
                        ...basket.offers.map(
                          (offer) => BasketInfoRequestEntity(
                            id: offer.product.id ?? 0,
                            qnt: offer.quantity ?? 1,
                            modifiers: offer.addOptions != null
                                ? offer.addOptions!
                                    .where((modifier) => modifier.id != null)
                                    .map((modifier) => BasketModifireEntity(
                                          id: modifier.id!,
                                          qnt: modifier.quantity,
                                        ))
                                    .toList()
                                : [],
                          ),
                        )
                      ],
                      deliveryId: deliveryId,
                    ),
                  );
                } else {
                  print(
                      'MAIN - SKIPPING BASKET RECALCULATION: address not set yet');
                }
              }
            },
          ),
          BlocListener<UserAddressBloc, UserAddressState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (addresses) {
                  if (addresses.isNotEmpty &&
                      getIt<CreateOrderStateCubit>().state.deliveryAddress ==
                          null) {
                    getIt<CreateOrderStateCubit>()
                        .setDeliveryAddress(addresses[0]);

                    // ВАЖНО: только после установки адреса вызываем пересчет корзины
                    if (getIt<BasketBloc>().state is BasketLoaded) {
                      final basket =
                          (getIt<BasketBloc>().state as BasketLoaded).basket;
                      final delivery =
                          getIt<CreateOrderStateCubit>().state.delivery;

                      if (delivery != null) {
                        print(
                            'MAIN - ADDRESS SET, RECALCULATING BASKET with deliveryId: ${delivery.id} and addressId: ${addresses[0].id}');
                        getIt<BasketInfoBloc>().add(
                          BasketInfoEvent.getBasketInfo(
                            basket.offers
                                .map((offer) => BasketInfoRequestEntity(
                                      id: offer.product.id ?? 0,
                                      qnt: offer.quantity ?? 1,
                                      modifiers: offer.addOptions != null
                                          ? offer.addOptions!
                                              .where((modifier) =>
                                                  modifier.id != null)
                                              .map((modifier) =>
                                                  BasketModifireEntity(
                                                    id: modifier.id!,
                                                    qnt: modifier.quantity,
                                                  ))
                                              .toList()
                                          : [],
                                    ))
                                .toList(),
                            deliveryId: delivery.id,
                          ),
                        );
                      }
                    }
                  }
                },
              );
            },
          ),
          BlocListener<FilialsBloc, FilialsState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (shops) {
                  if (shops.isNotEmpty &&
                      getIt<CreateOrderStateCubit>().state.deliveryShop ==
                          null) {
                    getIt<CreateOrderStateCubit>().setDeliveryShop(shops[0]);
                  }
                },
              );
            },
          ),
        ],
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {},
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale("ru", "RU"),
              Locale("en", "US"),
            ],
            title: 'Monobox',
            theme: AppTheme.light,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            //routerConfig: _appRouter.config(),
          ),
        ),
      ),
    );
  }
}
