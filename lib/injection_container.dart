import 'package:dadata/dadata.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:monobox/features/address_setup/domain/repository/geo_repository.dart';
import 'package:monobox/features/address_setup/domain/usecases/delete_useraddress_usecase.dart';
import 'package:monobox/features/address_setup/domain/usecases/edit_useraddress_usecase.dart';
import 'package:monobox/features/address_setup/domain/usecases/geo_available_usecase.dart';
import 'package:monobox/features/address_setup/domain/usecases/save_useraddress_usecase.dart';
import 'package:monobox/features/address_setup/presentation/bloc/geo_available/geo_available_bloc.dart';
import 'package:monobox/features/basket/domain/usecases/get_basket_info_usecase.dart';
import 'package:monobox/features/basket/presentation/bloc/basket_info/basket_info_bloc.dart';
import 'package:monobox/features/home/domain/usecases/action_usecase.dart';
import 'package:monobox/features/home/domain/usecases/serach_filials_usecase.dart';
import 'package:monobox/features/home/presentation/bloc/action/action_bloc.dart';
import 'package:monobox/features/more/data/repository/delivery_zones_repository_impl.dart';
import 'package:monobox/features/more/data/repository/pages_repositore_impl.dart';
import 'package:monobox/features/order/presentation/bloc/promocode/promocode_bloc.dart';
import 'package:monobox/features/profile/data/datasources/remote/feedback_service.dart';
import 'package:monobox/features/profile/domain/usecases/delete_profile_usecase.dart';
import 'package:monobox/features/profile/domain/usecases/loyalty_entry_usecase.dart';
import 'package:monobox/features/profile/presentation/bloc/delete_profile/delete_profile_bloc.dart';
import 'package:monobox/features/profile/presentation/bloc/loyalty_entry/loyalty_entry_bloc.dart';

import 'core/network/authorization_interceptor.dart';
import 'core/network/pretty_dio_logger.dart';
import 'core/resources/store.dart';
import 'features/address_setup/data/data_sources/remote/address_api_service.dart';
import 'features/address_setup/data/data_sources/remote/geo_api_service.dart';
import 'features/address_setup/data/repository/address_repository_impl.dart';
import 'features/address_setup/data/repository/geo_repository_impl.dart';
import 'features/address_setup/domain/repository/address_repository.dart';
import 'features/address_setup/domain/usecases/cities_order_usecase.dart';
import 'features/address_setup/domain/usecases/geo_suggestion_usecase.dart';
import 'features/address_setup/domain/usecases/geolocate_address_usecase.dart';
import 'features/address_setup/domain/usecases/get_user_addresses_usecase.dart';
import 'features/address_setup/presentation/bloc/address_setup_state_cubit/address_setup_state_cubit.dart';
import 'features/address_setup/presentation/bloc/cities_bloc/cities_bloc.dart';
import 'features/address_setup/presentation/bloc/create_address/create_address_bloc.dart';
import 'features/address_setup/presentation/bloc/geo_suggestion/geo_suggestion_cubit.dart';
import 'features/address_setup/presentation/bloc/geolocate_address/geolocate_address_bloc.dart';
import 'features/address_setup/presentation/bloc/user_address/user_address_bloc.dart';
import 'features/auth/data/datasources/remote/auth_api_service.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/auth_with_code_usecase.dart';
import 'features/auth/domain/usecases/get_auth_code_usecase.dart';
import 'features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'features/auth/presentation/bloc/send_code/send_code_bloc.dart';
import 'features/basket/data/data_sources/locale/basket_locale.dart';
import 'features/basket/data/data_sources/locale/basket_locale_impl.dart';
import 'features/basket/data/repository/basket_repository_impl.dart';
import 'features/basket/domain/repository/basket_repository.dart';
import 'features/basket/domain/usecases/add_basket_item_usecase.dart';
import 'features/basket/domain/usecases/get_basket_cart_items_usecase.dart';
import 'features/basket/domain/usecases/remove_all_basket_tems_usecase.dart';
import 'features/basket/domain/usecases/remove_basket_item_usecase.dart';
import 'features/basket/presentation/bloc/basket/basket_bloc.dart';
import 'features/basket/presentation/bloc/basket/gifts/gifts_bloc.dart';
import 'features/basket/presentation/bloc/basket/upsales/upsales_bloc.dart';
import 'features/home/data/data_sources/remote/banners_api_service.dart';
import 'features/home/data/data_sources/remote/categories_api_service.dart';
import 'features/home/data/data_sources/remote/collections_api_service.dart';
import 'features/home/data/data_sources/remote/filials_api_service.dart';
import 'features/home/data/data_sources/remote/products_api_service.dart';
import 'features/home/data/data_sources/remote/settings_api_service.dart';
import 'features/home/data/data_sources/remote/tags_api_service.dart';
import 'features/home/data/repository/banners_repository_impl.dart';
import 'features/home/data/repository/categories_repository_impl.dart';
import 'features/home/data/repository/collections_repository_impl.dart';
import 'features/home/data/repository/filials_repository_impl.dart';
import 'features/home/data/repository/products_repository_impl.dart';
import 'features/home/data/repository/settings_repository_impl.dart';
import 'features/home/data/repository/tags_repository_impl.dart';
import 'features/home/domain/repository/banners_repository.dart';
import 'features/home/domain/repository/categories_repository.dart';
import 'features/home/domain/repository/collections_repository.dart';
import 'features/home/domain/repository/filials_repository.dart';
import 'features/home/domain/usecases/banners_usecase.dart';
import 'features/home/domain/usecases/categories_usecase.dart';
import 'features/home/domain/usecases/cities_usecase.dart';
import 'features/home/domain/usecases/collection_usecase.dart';
import 'features/home/domain/usecases/collections_usecase.dart';
import 'features/home/domain/usecases/filials_usecase.dart';
import 'features/home/domain/usecases/products_usecase.dart';
import 'features/home/domain/usecases/settings_usecase.dart';
import 'features/home/domain/usecases/tags_usecase.dart';
import 'features/home/presentation/bloc/banners/banners_bloc.dart';
import 'features/home/presentation/bloc/categories/categories_bloc.dart';
import 'features/home/presentation/bloc/collection/collection_bloc.dart';
import 'features/home/presentation/bloc/collections/collections_bloc.dart';
import 'features/home/presentation/bloc/cubit/applied_filter_state_cubit.dart';
import 'features/home/presentation/bloc/cubit/search_cubit.dart';
import 'features/home/presentation/bloc/filials/filials_bloc.dart';
import 'features/home/presentation/bloc/cities/cities_bloc.dart'
    as filial_cities_bloc;
import 'features/home/presentation/bloc/gifts_scale/gifts_scale_bloc.dart';
import 'features/home/presentation/bloc/products/products_bloc.dart';
import 'features/home/presentation/bloc/settings/settings_bloc.dart';
import 'features/home/presentation/bloc/tags/tags_bloc.dart';
import 'features/more/data/data_source/remote/pages_api_service.dart';
import 'features/more/domain/usecases/get_delivery_zone_usecase.dart';
import 'features/more/domain/usecases/get_page_usecase.dart';
import 'features/more/presentation/bloc/delivery_zones/delivery_zones_bloc.dart';
import 'features/more/presentation/bloc/pages/pages_bloc.dart';
import 'features/order/data/datasources/remote/delivery_api_service.dart';
import 'features/order/data/datasources/remote/order_api_service.dart';
import 'features/order/data/datasources/remote/payment_api_service.dart';
import 'features/order/data/repositories/delivery_repository_impl.dart';
import 'features/order/data/repositories/order_repository_impl.dart';
import 'features/order/data/repositories/payment_repository_impl.dart';
import 'features/order/domain/repositories/order_repository.dart';
import 'features/order/domain/usecases/create_order_usecase.dart';
import 'features/order/domain/usecases/delete_order_usecase.dart';
import 'features/order/domain/usecases/delivery_usecase.dart';
import 'features/order/domain/usecases/get_gift_scale_usecase.dart';
import 'features/order/domain/usecases/get_gifts_usecase.dart';
import 'features/order/domain/usecases/get_order_usecase.dart';
import 'features/order/domain/usecases/get_orders_usecase.dart';
import 'features/order/domain/usecases/get_upsales_usecase.dart';
import 'features/order/domain/usecases/payment_methods_usecase.dart';
import 'features/order/presentation/bloc/order_details/order_details_bloc.dart';
import 'features/order/presentation/bloc/orders_list/orders_list_bloc.dart';
import 'features/order/presentation/bloc/create_order_state_cubit/create_order_state_cubit.dart';
import 'features/order/presentation/bloc/deliveries/deliveries_bloc.dart';
import 'features/order/presentation/bloc/order/order_bloc.dart';
import 'features/order/presentation/bloc/payment_methods/payment_methods_bloc.dart';
import 'features/profile/data/datasources/remote/loyalty_api_service.dart';
import 'features/profile/data/datasources/remote/profile_api_service.dart';
import 'features/profile/data/repositories/loyalty_repository_impl.dart';
import 'features/profile/data/repositories/profile_repository_impl.dart';
import 'features/profile/domain/repositories/profile_repository.dart';
import 'features/profile/domain/usecases/add_child_usecase.dart';
import 'features/profile/domain/usecases/add_order_feedback.dart';
import 'features/profile/domain/usecases/change_notification_status_usecase.dart';
import 'features/profile/domain/usecases/childrens_usecase.dart';
import 'features/profile/domain/usecases/edit_profile_usecase.dart';
import 'features/profile/domain/usecases/get_notification_settings_usecase.dart';
import 'features/profile/domain/usecases/loyalty_usecase.dart';
import 'features/profile/domain/usecases/profile_usecase.dart';
import 'features/profile/presentation/bloc/add_child/add_child_bloc.dart';
import 'features/profile/presentation/bloc/add_feedback/add_feedback_bloc.dart';
import 'features/profile/presentation/bloc/loyalty/loyalty_bloc.dart';
import 'features/profile/presentation/bloc/notification/notification_settings_bloc.dart';
import 'features/profile/presentation/bloc/childrens/childrens_bloc.dart';
import 'features/profile/presentation/bloc/profile/profile_cubit.dart';
import 'features/profile/presentation/bloc/update_profile/update_profile_bloc.dart';

final getIt = GetIt.instance;

Future setupDependencies() async {
  final Logger log = Logger(
    printer: PrettyPrinter(),
    level: kDebugMode ? Level.trace : Level.off,
  );

  final DadataClient dadataClient =
      DadataClient(token: '935ee067813f09dcba08f4ebaf63d422a4006d6d');

  final Store store = await Store.getInstance();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://admin.monobox.app/api/v1',
    ),
  );

  dio.interceptors.add(AuthorizationInterceptor(
    store: store,
  ));

  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
  );

  getIt.registerLazySingleton<Logger>(() => log);

  getIt.registerLazySingleton<Store>(() => store);

  //Services
  getIt.registerLazySingleton<BannersApiService>(
    () => BannersApiService(dio),
  );
  getIt.registerLazySingleton<CategoriesApiService>(
    () => CategoriesApiService(dio),
  );
  getIt.registerLazySingleton<BasketLocale>(
    () => BasketLocaleImpl(),
  );
  getIt.registerLazySingleton<AuthApiService>(
    () => AuthApiService(dio),
  );
  getIt.registerLazySingleton<CollectionsApiService>(
    () => CollectionsApiService(dio),
  );
  getIt.registerLazySingleton<OrderApiService>(
    () => OrderApiService(dio),
  );

  final ProfileApiService profileApiService = ProfileApiService(dio);

  final FilialsApiService filialsApiService = FilialsApiService(dio);

  //Repositories
  getIt.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(
      service: AddressApiService(dio),
      dadataClient: dadataClient,
    ),
  );
  getIt.registerLazySingleton<BannersRepository>(
    () => BannersRepositoryImpl(service: getIt()),
  );
  getIt.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(service: getIt()),
  );
  getIt.registerLazySingleton<BasketRepository>(
    () => BasketRepositoryImpl(
      basketLocale: getIt(),
      service: getIt<OrderApiService>(),
    ),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(service: getIt()),
  );
  getIt.registerLazySingleton<CollectionsRepository>(
    () => CollectionsRepositoryImpl(service: getIt()),
  );
  getIt.registerLazySingleton<GeoRepository>(
    () => GeoRepositoryImpl(service: GeoApiService(dio)),
  );

  final ProfileRepository profileRepository = ProfileRepositoryImpl(
    service: profileApiService,
    feedbackService: FeedbackService(dio),
  );

  final FilialsRepository filialsRepository = FilialsRepositoryImpl(
    service: filialsApiService,
  );

  final OrderRepository orderRepository = OrderRepositoryImpl(
    service: getIt(),
  );

  //UseCases
  getIt.registerLazySingleton<GeolocateAddressUsecase>(
    () => GeolocateAddressUsecase(
      addressRepository: getIt<AddressRepository>(),
    ),
  );
  getIt.registerLazySingleton<CitiesOrderUsecase>(
    () => CitiesOrderUsecase(
      addressRepository: getIt<AddressRepository>(),
    ),
  );
  getIt.registerLazySingleton<BannersUsecase>(
    () => BannersUsecase(
      bannersRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<CategoriesUsecase>(
    () => CategoriesUsecase(
      categoriesRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<GetAllBasketItemsUseCase>(
    () => GetAllBasketItemsUseCase(
      basketRepository: getIt<BasketRepository>(),
    ),
  );
  getIt.registerLazySingleton<AddBasketItemUseCase>(
    () => AddBasketItemUseCase(
      basketRepository: getIt<BasketRepository>(),
    ),
  );
  getIt.registerLazySingleton<RemoveBasketItemUseCase>(
    () => RemoveBasketItemUseCase(
      basketRepository: getIt<BasketRepository>(),
    ),
  );
  getIt.registerLazySingleton<RemoveAllBasketItemsUseCase>(
    () => RemoveAllBasketItemsUseCase(
      basketRepository: getIt<BasketRepository>(),
    ),
  );
  getIt.registerLazySingleton<GetAuthCodeUseCase>(
    () => GetAuthCodeUseCase(
      authRepository: getIt<AuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<AuthWithCodeUsecase>(
    () => AuthWithCodeUsecase(
      authRepository: getIt<AuthRepository>(),
    ),
  );
  getIt.registerLazySingleton<CollectionsUsecase>(
    () => CollectionsUsecase(
      collectionsRepository: getIt<CollectionsRepository>(),
    ),
  );
  getIt.registerLazySingleton<CollectionUsecase>(
    () => CollectionUsecase(
      collectionsRepository: getIt<CollectionsRepository>(),
    ),
  );

  //Blocs
  getIt.registerLazySingleton<GeolocateAddressBloc>(
    () => GeolocateAddressBloc(
      getIt<GeolocateAddressUsecase>(),
    ),
  );
  getIt.registerLazySingleton<CitiesBloc>(
    () => CitiesBloc(
      getIt<CitiesOrderUsecase>(),
    ),
  );
  getIt.registerLazySingleton<AddressSetupStateCubit>(
    () => AddressSetupStateCubit(),
  );
  getIt.registerLazySingleton<BannersBloc>(
    () => BannersBloc(
      getIt<BannersUsecase>(),
    ),
  );
  getIt.registerLazySingleton<CategoriesBloc>(
    () => CategoriesBloc(
      getIt<CategoriesUsecase>(),
    ),
  );
  getIt.registerLazySingleton<BasketBloc>(
    () => BasketBloc(
      getAllBasketItemsUseCase: getIt<GetAllBasketItemsUseCase>(),
      addBasketItemUseCase: getIt<AddBasketItemUseCase>(),
      removeBasketItemUseCase: getIt<RemoveBasketItemUseCase>(),
      removeAllBasketItemsUseCase: getIt<RemoveAllBasketItemsUseCase>(),
    ),
  );
  getIt.registerLazySingleton<CreateOrderStateCubit>(
    () => CreateOrderStateCubit(),
  );
  getIt.registerLazySingleton<SendCodeBloc>(
    () => SendCodeBloc(
      getAuthCodeUseCase: getIt<GetAuthCodeUseCase>(),
      authWithCodeUsecase: getIt<AuthWithCodeUsecase>(),
    ),
  );
  getIt.registerLazySingleton<AuthBloc>(
    () => AuthBloc(store),
  );
  getIt.registerLazySingleton<CollectionsBloc>(
    () => CollectionsBloc(
      getIt<CollectionsUsecase>(),
    ),
  );
  getIt.registerLazySingleton<CollectionBloc>(
    () => CollectionBloc(
      getIt<CollectionUsecase>(),
    ),
  );
  getIt.registerLazySingleton<DeliveryBloc>(
    () => DeliveryBloc(
      DeliveryUsecase(
        deliveryRepository: DeliveryRepositoryImpl(
          service: DeliveryApiService(dio),
        ),
      ),
    ),
  );
  getIt.registerLazySingleton<PaymentMethodsBloc>(
    () => PaymentMethodsBloc(
      PaymentMethodsUsecase(
        paymentRepository: PaymentRepositoryImpl(
          service: PaymentApiService(dio),
        ),
      ),
    ),
  );
  getIt.registerLazySingleton<OrderBloc>(
    () => OrderBloc(
      CreateOrderUsecase(
        orderRepository: orderRepository,
      ),
      DeleteOrderUsecase(
        orderRepository: orderRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(
      ProfileUsecase(
        profileRepository: profileRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<UpdateProfileBloc>(
    () => UpdateProfileBloc(
      EditProfileUsecase(
        profileRepository: profileRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<DeleteProfileBloc>(
    () => DeleteProfileBloc(
      DeleteProfileUsecase(
        profileRepository: profileRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<ChildrensBloc>(
    () => ChildrensBloc(
      ChildrensUsecase(
        profileRepository: profileRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<AddChildBloc>(
    () => AddChildBloc(
      AddChildUsecase(
        profileRepository: profileRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<OrdersListBloc>(
    () => OrdersListBloc(
      GetOrdersUsecase(
        orderRepository: orderRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<OrderDetailsBloc>(
    () => OrderDetailsBloc(
      GetOrderUsecase(
        orderRepository: orderRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<UserAddressBloc>(
    () => UserAddressBloc(
      GetUserAddressesUsecase(
        addressRepository: getIt<AddressRepository>(),
      ),
    ),
  );
  getIt.registerLazySingleton<TagsBloc>(
    () => TagsBloc(
      TagsUsecase(
        tagsRepository: TagsRepositoryImpl(
          service: TagsApiService(dio),
        ),
      ),
    ),
  );
  getIt.registerLazySingleton<GiftsBloc>(
    () => GiftsBloc(
      GetGiftsUsecase(
        orderRepository: orderRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<UpsalesBloc>(
    () => UpsalesBloc(
      GetUpsalesUsecase(
        orderRepository: orderRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<NotificationSettingsBloc>(
    () => NotificationSettingsBloc(
      GetNotificationSettingsUsecase(
        profileRepository: profileRepository,
      ),
      ChangeNotificationStatusUsecase(
        profileRepository: profileRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<AppliedFilterStateCubit>(
    () => AppliedFilterStateCubit(),
  );
  getIt.registerLazySingleton<ProductsBloc>(
    () => ProductsBloc(
      ProductsUsecase(
        repository: ProductsRepositoryImpl(
          service: ProductsApiService(dio),
        ),
      ),
    ),
  );
  getIt.registerLazySingleton<SettingsBloc>(
    () => SettingsBloc(
      SettingsUsecase(
        repository: SettingsRepositoryImpl(
          service: SettingsApiService(dio),
        ),
      ),
    ),
  );
  getIt.registerLazySingleton<AddFeedbackBloc>(
    () => AddFeedbackBloc(
      AddOrderFeedbackUsecase(
        repository: profileRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<FilialsBloc>(
    () => FilialsBloc(
      FilialsUsecase(
        repository: filialsRepository,
      ),
      SearchFilialsUsecase(
        repository: filialsRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<filial_cities_bloc.CitiesBloc>(
    () => filial_cities_bloc.CitiesBloc(
      CitiesUsecase(
        repository: filialsRepository,
      ),
    ),
  );
  getIt.registerFactory<PagesBloc>(
    () => PagesBloc(
      GetPageUsecase(
        repository: PagesRepositoryImpl(
          service: PagesApiService(dio),
        ),
      ),
    ),
  );
  getIt.registerLazySingleton<CreateAddressBloc>(
    () => CreateAddressBloc(
      saveUserAddressesUsecase: SaveUserAddressesUsecase(
        repository: getIt(),
      ),
      deleteUserAddressesUsecase: DeleteUserAddressesUsecase(
        repository: getIt(),
      ),
      editUserAddressesUsecase: EditUserAddressesUsecase(
        repository: getIt(),
      ),
    ),
  );
  getIt.registerLazySingleton<SearchCubit>(
    () => SearchCubit(),
  );
  getIt.registerLazySingleton<DeliveryZonesBloc>(
    () => DeliveryZonesBloc(
      GetDeliveryZoneUsecase(
        repository: DeliveryZonesRepositoryImpl(service: PagesApiService(dio)),
      ),
    ),
  );
  getIt.registerLazySingleton<GeoSuggestionCubit>(
    () => GeoSuggestionCubit(
      GeoSuggestionUsecase(
        repository: getIt(),
      ),
    ),
  );
  getIt.registerLazySingleton<LoyaltyBloc>(
    () => LoyaltyBloc(
      LoyaltyUsecase(
        repository: LoyaltyRepositoryImpl(service: LoyaltyApiService(dio)),
      ),
    ),
  );
  getIt.registerLazySingleton<LoyaltyEntryBloc>(
    () => LoyaltyEntryBloc(
      LoyaltyEntryUsecase(
        repository: LoyaltyRepositoryImpl(service: LoyaltyApiService(dio)),
      ),
    ),
  );
  getIt.registerLazySingleton<GiftsScaleBloc>(
    () => GiftsScaleBloc(
      GetGiftScaleUsecase(
        orderRepository: orderRepository,
      ),
    ),
  );
  getIt.registerLazySingleton<BasketInfoBloc>(
    () => BasketInfoBloc(
      GetBasketInfoUsecase(
        basketRepository: getIt<BasketRepository>(),
      ),
    ),
  );
  getIt.registerLazySingleton<GeoAvailableBloc>(
    () => GeoAvailableBloc(
      GeoavailableUsecase(
        repository: getIt(),
      ),
    ),
  );
  getIt.registerLazySingleton<PromocodeBloc>(
    () => PromocodeBloc(
      orderRepository,
    ),
  );
  getIt.registerLazySingleton<ActionBloc>(
    () => ActionBloc(
      ActionUsecase(
        bannersRepository: getIt(),
      ),
    ),
  );
}
