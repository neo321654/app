import 'package:monobox/features/order/domain/entities/promocode_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../home/domain/entities/product_entity.dart';
import '../entities/gifts_scale_entity.dart';
import '../entities/order_created_entity.dart';
import '../entities/order_create_entity.dart';
import '../entities/order_details_entity.dart';
import '../entities/order_entity.dart';
import '../entities/upsale_entity.dart';
import '../entities/upsale_request_entity.dart';

abstract class OrderRepository {
  Future<DataState<OrderCreatedEntity>?> createOrder(
    OrderCreateEntity orderEntity,
  );

  Future<DataState<List<OrderEntity>>> getOrders();

  Future<DataState<OrderDetailsEntity>> getOrder(int orderId);

  Future<DataState<List<ProductEntity>>> getGifts(
    OrderCreateEntity orderEntity,
  );

  Future<DataState<List<UpsaleEntity>>> getUpsales(
    UpsaleRequestEntity upsaleRequest,
  );

  Future<DataState<void>> deleteOrder(int orderId);

  Future<DataState<List<GiftsScaleEntity>>> getGiftsScale();

  Future<DataState<PromocodeEntity>> getPromocode(String promocode);

  Future<DataState<String>> getPaymentUrl(int orderId);
}
