import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:monobox/features/order/data/models/gifts_scale_item_dto.dart';
import 'package:monobox/features/order/data/models/promocode_dto.dart';
import 'package:monobox/features/order/domain/entities/gifts_scale_entity.dart';
import 'package:monobox/features/order/domain/entities/promocode_entity.dart';
import 'package:monobox/features/order/domain/entities/upsale_entity.dart';
import 'package:monobox/features/order/domain/entities/upsale_request_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../home/data/repository/mappers/products_mapper.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../../domain/entities/delivery_entity.dart';
import '../../domain/entities/order_created_entity.dart';
import '../../domain/entities/order_create_entity.dart';
import '../../domain/entities/order_details_address_entity.dart';
import '../../domain/entities/order_details_entity.dart';
import '../../domain/entities/order_details_status_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/entities/order_product_entity.dart';
import '../../domain/entities/payment_method_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/remote/order_api_service.dart';
import '../models/gifts_dto.dart';
import '../models/order_create_response_dto.dart';
import '../models/order_details_dto.dart';
import '../models/order_dto.dart';
import '../models/upsale_request_dto.dart';
import '../models/upsales_dto.dart';
import 'mappers/order_mapper.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderApiService service;

  OrderRepositoryImpl({required this.service});

  @override
  Future<DataState<OrderCreatedEntity>?> createOrder(
    OrderCreateEntity orderEntity,
  ) async {
    try {
      final orderDto = OrderMapper.toModel(orderEntity);
      OrderCreateResponseDto orderCreated = await service.create(orderDto);
      return DataSuccess(OrderMapper.toEntity(orderCreated));
    } on DioException catch (e) {
      print('DioException in createOrder: ${e.message}');
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<OrderDetailsEntity>> getOrder(int orderId) async {
    OrderDetailsDto order = await service.getOrder(orderId);

    return DataSuccess(
      OrderDetailsEntity(
          id: order.id,
          number: order.number != null ? order.number.toString() : '',
          status: order.status,
          totalPrice: Decimal.parse(order.totalPrice.toString()),
          createdAt: DateFormat('dd.MM.yyyy HH:mm').parse(order.createdAt),
          comment: order.comment,
          delivery: DeliveryEntity(
            id: order.delivery.id,
            name: order.delivery.name,
            type: order.delivery.type,
          ),
          payment: PaymentMethodEntity(
            id: order.payment.id,
            name: order.payment.name,
            code: order.payment.code ?? '',
          ),
          statuses: order.statuses
              .map((p) => OrderDetailsStatusEntity(
                    id: p.id,
                    title: p.title,
                    subtitle: p.subtitle,
                    active: p.active,
                    date: p.date ?? '',
                  ))
              .toList(),
          products: order.products
              .map((p) => OrderProductEntity(
                    id: p.id,
                    qnt: p.qnt,
                    title: p.title,
                    image: p.image,
                    price: Decimal.parse(p.price.toString()),
                    total: Decimal.parse(p.total.toString()),
                    isCombo: p.isCombo,
                    isHalfPizza: p.isHalfPizza,
                  ))
              .toList(),
          paymentStatus: order.paymentStatus,
          needReview: order.needReview,
          address: order.address != null
              ? OrderDetailsAddressEntity(
                  id: order.address!.id,
                  title: order.address!.title,
                  zipcode: order.address!.zipcode,
                  country: order.address!.country,
                  region: order.address!.region,
                  city: order.address!.city,
                  house: order.address!.house,
                  building: order.address!.building,
                  entrance: order.address!.entrance,
                  floor: order.address!.floor,
                  appartment: order.address!.appartment,
                  kladrId: order.address!.kladrId,
                  uid: order.address!.uid,
                  domofon: order.address!.domofon,
                )
              : null),
    );
  }

  @override
  Future<DataState<List<OrderEntity>>> getOrders() async {
    List<OrderDto> orders = await service.getOrders();

    return DataSuccess([
      ...orders.map((order) => OrderEntity(
            id: order.id,
            number: order.number,
            status: order.status,
            totalPrice: Decimal.parse(order.totalPrice.toString()),
            createdAt:
                DateFormat('dd.MM.yyyy HH:mm').parse(order.createdAt, true),
            needReview: order.needReview,
            products: order.products
                .map((p) => OrderProductEntity(
                      id: p.id,
                      qnt: p.qnt,
                      title: p.title,
                      image: p.image,
                      price: Decimal.parse(p.price.toString()),
                      total: Decimal.parse(p.total.toString()),
                      isCombo: p.isCombo,
                      isHalfPizza: p.isHalfPizza,
                    ))
                .toList(),
          ))
    ]);
  }

  @override
  Future<DataState<List<ProductEntity>>> getGifts(
      OrderCreateEntity orderEntity) async {
    GiftsDto gifts = await service.gifts(
      OrderMapper.toModel(
        orderEntity,
      ),
    );

    return DataSuccess(
      ProductsMapper.toProductsEntity(gifts.gifts),
    );
  }

  @override
  Future<DataState<List<UpsaleEntity>>> getUpsales(
      UpsaleRequestEntity upsaleRequest) async {
    List<UpsalesDto> upsales = await service.upsale(
      UpsaleRequestDto(
        types: upsaleRequest.types,
      ),
    );

    return DataSuccess(
      [
        ...upsales.map(
          (upsale) => UpsaleEntity(
            title: upsale.title,
            products: ProductsMapper.toProductsEntity(
              upsale.products,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Future<DataState<void>> deleteOrder(int orderId) async {
    try {
      await service.deleteOrder(orderId);

      return const DataSuccess(DataSuccess.new);
    } on DioException catch (e) {
      return DataFailed(
        DioException(
          requestOptions: e.requestOptions,
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<DataState<List<GiftsScaleEntity>>> getGiftsScale() async {
    try {
      List<GiftsScaleItemDto> giftsScales = await service.giftsScale();

      return DataSuccess(
        [
          ...giftsScales.map(
            (g) => GiftsScaleEntity(
              title: g.title,
              price: g.price,
              product: ProductsMapper.toProductEntity(
                g.product,
              ),
            ),
          ),
        ],
      );
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<PromocodeEntity>> getPromocode(String promocode) async {
    try {
      PromocodeDto promocodeResponse = await service.getPromocode(promocode);

      return DataSuccess(PromocodeEntity(
        code: promocodeResponse.code,
        message: promocodeResponse.message,
      ));
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return DataFailed(
          DioException(
            requestOptions: e.requestOptions,
            message: e.response?.data['message'],
          ),
        );
      }
      return DataFailed(e);
    }
  }
}
