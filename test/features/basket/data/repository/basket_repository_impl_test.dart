import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:monobox/core/resources/data_state.dart';
import 'package:monobox/features/basket/data/repository/basket_repository_impl.dart';
import 'package:monobox/features/basket/domain/entities/basket_info_entity.dart';
import 'package:monobox/features/basket/domain/entities/basket_profile_bonus_entity.dart';
import 'package:monobox/features/order/data/models/basket_total_info_dto.dart';
import 'package:monobox/features/order/data/datasources/remote/order_api_service.dart';
import 'package:monobox/features/order/data/models/basket_info_dto.dart';
import 'package:monobox/features/order/data/models/basket_profile_bonus_dto.dart';
import 'package:monobox/features/basket/data/data_sources/locale/basket_locale.dart';
import 'package:monobox/features/order/data/models/basket_pretotal_info_dto.dart';
import 'package:monobox/features/home/data/models/product_dto.dart';

import 'basket_repository_impl_test.mocks.dart';

import 'package:monobox/features/order/presentation/bloc/create_order_state_cubit/create_order_state_cubit.dart';
import 'package:monobox/features/order/presentation/models/create_order_state.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

@GenerateMocks([OrderApiService, BasketLocale, CreateOrderStateCubit])
void main() {
  late MockOrderApiService mockOrderApiService;
  late MockBasketLocale mockBasketLocale;
  late MockCreateOrderStateCubit mockCreateOrderStateCubit;
  late BasketRepositoryImpl repository;

  setUp(() {
    mockOrderApiService = MockOrderApiService();
    mockBasketLocale = MockBasketLocale();
    mockCreateOrderStateCubit = MockCreateOrderStateCubit();

    // Register mock CreateOrderStateCubit with GetIt
    if (!getIt.isRegistered<CreateOrderStateCubit>()) {
      getIt.registerFactory<CreateOrderStateCubit>(
          () => mockCreateOrderStateCubit);
    }

    // Stub the state of CreateOrderStateCubit
    when(mockCreateOrderStateCubit.state).thenReturn(const CreateOrderState());

    repository = BasketRepositoryImpl(
      basketLocale: mockBasketLocale,
      service: mockOrderApiService,
    );
  });

  group('getBasketInfo', () {
    test(
        'should return BasketInfoEntity with profileBonus when API call is successful',
        () async {
      // Arrange
      const basketProfileBonusDto = BasketProfileBonusDto(
        totalBonus: 100,
        availableBonus: 50,
      );
      final basketTotalInfoDto = BasketTotalInfoDto(
        total: 1000,
        discountPrice: 100,
      );
      final productDto = ProductDto(
        id: 1,
        name: 'Test Product',
        price: 100,
        picture: 'image.png',
        isCombo: false,
        isHalfPizza: false,
      );
      final basketPretotalInfoDto = BasketPretotalnfoDto(
        title: 'Delivery',
        value: '150 ₽',
      );
      final basketInfoDto = BasketInfoDto(
        products: [productDto],
        totalInfo: basketTotalInfoDto,
        pretotalInfo: [basketPretotalInfoDto],
        bonusInfo: basketPretotalInfoDto,
        warnings: [],
        timeDelay: '30-60 min',
        profileBonus: basketProfileBonusDto,
      );

      when(mockOrderApiService.basketInfo(any))
          .thenAnswer((_) async => basketInfoDto);

      // Act
      final result = await repository.getBasketInfo([], 1);

      // Assert
      expect(result, isA<DataSuccess<BasketInfoEntity>>());
      expect(result.data, isA<BasketInfoEntity>());
      expect(result.data!.profileBonus, isA<BasketProfileBonusEntity>());
      expect(result.data!.profileBonus!.totalBonus, 100);
      expect(result.data!.profileBonus!.availableBonus, 50);
    });

    test(
        'should return BasketInfoEntity without profileBonus when API call is successful but profileBonus is null',
        () async {
      // Arrange
      final basketTotalInfoDto = BasketTotalInfoDto(
        total: 1000,
        discountPrice: 100,
      );
      final productDto = ProductDto(
        id: 1,
        name: 'Test Product',
        price: 100,
        picture: 'image.png',
        isCombo: false,
        isHalfPizza: false,
      );
      final basketPretotalInfoDto = BasketPretotalnfoDto(
        title: 'Delivery',
        value: '150 ₽',
      );
      final basketInfoDto = BasketInfoDto(
        products: [productDto],
        totalInfo: basketTotalInfoDto,
        pretotalInfo: [basketPretotalInfoDto],
        bonusInfo: basketPretotalInfoDto,
        warnings: [],
        timeDelay: '30-60 min',
        profileBonus: null,
      );

      when(mockOrderApiService.basketInfo(any))
          .thenAnswer((_) async => basketInfoDto);

      // Act
      final result = await repository.getBasketInfo([], 1);

      // Assert
      expect(result, isA<DataSuccess<BasketInfoEntity>>());
      expect(result.data, isA<BasketInfoEntity>());
      expect(result.data!.profileBonus, isNull);
    });

    test('should return DataFailed when API call is unsuccessful', () async {
      // Arrange
      when(mockOrderApiService.basketInfo(any)).thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        message: 'API Error',
      ));

      // Act
      final result = await repository.getBasketInfo([], 1);

      // Assert
      expect(result, isA<DataFailed>());
      expect(result.error, isA<DioException>());
    });
  });
}
