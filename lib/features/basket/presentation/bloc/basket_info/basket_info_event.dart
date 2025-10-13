part of 'basket_info_bloc.dart';

@freezed
class BasketInfoEvent with _$BasketInfoEvent {
  const factory BasketInfoEvent.getBasketInfo(
      List<BasketInfoRequestEntity> request,
      {int? deliveryId}) = _GetBasketInfo;
}
