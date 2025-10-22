import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:monobox/features/basket/domain/entities/basket_info_request_entity.dart';
import 'package:monobox/features/home/data/repository/mappers/products_mapper.dart';
import 'package:monobox/features/order/presentation/bloc/create_order_state_cubit/create_order_state_cubit.dart';
import 'package:monobox/injection_container.dart';

import '../../../../core/resources/data_state.dart';
import '../../../order/data/datasources/remote/order_api_service.dart';
import '../../../order/data/models/basket_info_dto.dart';
import '../../../order/data/models/basket_info_request_basket_dto.dart';
import '../../../order/data/models/basket_info_request_dto.dart';
import '../../../order/data/models/basket_modifire_dto.dart';
// Import BasketProfileBonusDto
import '../../domain/entities/basket_info_entity.dart';
import '../../domain/entities/basket_offer_entity.dart';
import '../../domain/entities/basket_pretotal_info_entity.dart';
import '../../domain/entities/basket_total_info_entity.dart';
import '../../domain/entities/basket_profile_bonus_entity.dart'; // Import BasketProfileBonusEntity
import '../../domain/repository/basket_repository.dart';
import '../data_sources/locale/basket_locale.dart';
import '../models/basket_offer_dto.dart';
import 'mappers/basket_offer_mapper.dart';

class BasketRepositoryImpl implements BasketRepository {
  final BasketLocale _basketLocale;
  final OrderApiService _service;

  BasketRepositoryImpl({
    required BasketLocale basketLocale,
    required OrderApiService service,
  })  : _basketLocale = basketLocale,
        _service = service;

  @override
  Future<DataState<void>> addBasketItem(BasketOfferEntity offer) async {
    return DataSuccess(
      await _basketLocale.addBasketItem(
        BasketOfferMapper.toModel(
          offer,
        ),
      ),
    );
  }

  @override
  Future<DataState<List<BasketOfferEntity>>> getAllBasketItems() async {
    List<BasketOfferDto> offers = _basketLocale.getAllBasketItems();

    return DataSuccess(BasketOfferMapper.toEntities(offers));
  }

  @override
  Future<DataState<void>> removeAllBasketItems() async {
    print('BASKET REPOSITORY - REMOVING ALL BASKET ITEMS');
    try {
      await _basketLocale.removeAllBasketItems();
      print('BASKET REPOSITORY - ALL BASKET ITEMS REMOVED SUCCESSFULLY');
      return const DataSuccess(null);
    } catch (e) {
      print('BASKET REPOSITORY - ERROR REMOVING BASKET ITEMS: $e');
      return DataFailed(DioException(
        requestOptions: RequestOptions(path: ''),
        message: e.toString(),
      ));
    }
  }

  @override
  Future<DataState<void>> removeBasketItem(BasketOfferEntity offer) async {
    return DataSuccess(
      await _basketLocale.removeBasketItem(
        BasketOfferMapper.toModel(
          offer,
        ),
      ),
    );
  }

  @override
  Future<DataState<BasketInfoEntity>> getBasketInfo(
      List<BasketInfoRequestEntity> request, int deliveryId) async {
    try {
      final createOrderState = getIt<CreateOrderStateCubit>().state;
      final addressId = createOrderState.deliveryAddress?.id;
      final filialId = createOrderState.deliveryShop?.id;

      var requestDto = BasketInfoRequestBasketDto(
        basket: request
            .map((r) => BasketInfoRequestDto(
                  id: r.id,
                  qnt: r.qnt,
                  modifiers: r.modifiers
                          .map((m) => BasketModifireDto(
                                id: m.id ?? 0,
                                qnt: m.qnt ?? 0,
                              ))
                          .toList() ??
                      [],
                ))
            .toList(),
        deliveryId: deliveryId,
        addressId: addressId,
        filialId: filialId,
      );
      BasketInfoDto basketInfo = await _service.basketInfo(requestDto);
      print('BASKET REQUEST: ${jsonEncode(requestDto.toJson())}');
      print('DELIVERY ID: $deliveryId');
      print('BASKET REQUEST - DELIVERY ID: ${requestDto.deliveryId}');
      print('BASKET REQUEST - ADDRESS ID: ${requestDto.addressId}');
      return DataSuccess(
        BasketInfoEntity(
          products: ProductsMapper.toProductsEntity(basketInfo.products),
          totalInfo: BasketTotalInfoEntity(
            total: basketInfo.totalInfo.total,
            discountPrice: basketInfo.totalInfo.discountPrice,
          ),
          pretotalInfo: basketInfo.pretotalInfo
              .map((pretotalInfo) => BasketPretotalnfoEntity(
                    title: pretotalInfo.title ?? "",
                    value: pretotalInfo.value ?? "",
                  ))
              .toList(),
          bonusInfo: BasketPretotalnfoEntity(
            title: basketInfo.bonusInfo.title ?? "",
            value: basketInfo.bonusInfo.value ?? "",
          ),
          warnings: basketInfo.warnings,
          timeDelay: basketInfo.timeDelay,
          profileBonus: basketInfo.profileBonus != null
              ? BasketProfileBonusEntity(
                  totalBonus: basketInfo.profileBonus!.totalBonus,
                  availableBonus: basketInfo.profileBonus!.availableBonus,
                )
              : null,
        ),
      );
    } on DioException catch (e) {
      print('DioException in getBasketInfo: ${e.message}');
      print('Response status: ${e.response?.statusCode}');
      final responseData = e.response?.data.toString();
      if (responseData != null) {
        const maxLogLength = 1000;
        print(
            'Response data: ${responseData.length > maxLogLength ? '${responseData.substring(0, maxLogLength)}...' : responseData}');
      }

      String errorMessage = 'Не удалось получить информацию о корзине.';
      if (e.response?.statusCode == 500) {
        errorMessage =
            'Ошибка сервера: неверный формат запроса. Пожалуйста, попробуйте снова.';
      }

      return DataFailed(
        DioException(
          requestOptions: e.requestOptions,
          message: errorMessage,
          response: e.response,
          error: e.error,
        ),
      );
    }
  }
}
