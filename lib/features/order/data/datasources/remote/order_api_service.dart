import 'package:monobox/features/order/data/models/gifts_scale_item_dto.dart';
import 'package:monobox/features/order/data/models/promocode_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../models/basket_info_dto.dart';
import '../../models/basket_info_request_basket_dto.dart';
import '../../models/gifts_dto.dart';
import '../../models/order_create_request_dto.dart';
import '../../models/order_create_response_dto.dart';
import '../../models/order_details_dto.dart';
import '../../models/order_dto.dart';
import '../../models/upsale_request_dto.dart';
import '../../models/upsales_dto.dart';
import '../../models/payment_url_dto.dart';

part 'order_api_service.g.dart';

@RestApi()
abstract class OrderApiService {
  factory OrderApiService(Dio dio) = _OrderApiService;

  @POST('/order/create')
  Future<OrderCreateResponseDto> create(
    @Body() OrderCreateRequestDto orderCreateRequestDto,
  );

  @GET('/order')
  Future<List<OrderDto>> getOrders();

  @GET('/order/{id}')
  Future<OrderDetailsDto> getOrder(
    @Path('id') int id,
  );

  @DELETE('/order/{id}')
  Future<void> deleteOrder(
    @Path('id') int id,
  );

  @POST('/basket')
  Future<GiftsDto> gifts(
    @Body() OrderCreateRequestDto orderCreateRequestDto,
  );

  @GET('/basket/gifts/scale')
  Future<List<GiftsScaleItemDto>> giftsScale();

  @POST('/basket/upsale')
  Future<List<UpsalesDto>> upsale(
    @Body() UpsaleRequestDto upsaleRequest,
  );

  @POST('/basket')
  Future<BasketInfoDto> basketInfo(
    @Body() BasketInfoRequestBasketDto basketInfoReques,
  );

  @GET('/promocode/{promocode}')
  Future<PromocodeDto> getPromocode(
    @Path('promocode') String promocode,
  );

  @GET('/order/pay/{id}')
  Future<PaymentUrlDto> getPaymentUrl(
    @Path('id') int id,
  );
}
