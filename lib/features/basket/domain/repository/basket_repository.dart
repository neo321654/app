import '../../../../core/resources/data_state.dart';
import '../entities/basket_info_entity.dart';
import '../entities/basket_info_request_entity.dart';
import '../entities/basket_offer_entity.dart';

abstract class BasketRepository {
  Future<DataState<List<BasketOfferEntity>>> getAllBasketItems();
  Future<DataState<void>> addBasketItem(BasketOfferEntity offer);
  Future<DataState<void>> removeBasketItem(BasketOfferEntity offer);
  Future<DataState<void>> removeAllBasketItems();
  Future<DataState<BasketInfoEntity>> getBasketInfo(
      List<BasketInfoRequestEntity> request, int deliveryId);
}
