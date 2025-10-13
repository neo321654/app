// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_info_request_basket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketInfoRequestBasketDto _$BasketInfoRequestBasketDtoFromJson(
        Map<String, dynamic> json) =>
    BasketInfoRequestBasketDto(
      basket: (json['basket'] as List<dynamic>)
          .map((e) => BasketInfoRequestDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryId: (json['delivery_id'] as num).toInt(),
      addressId: (json['address_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BasketInfoRequestBasketDtoToJson(
    BasketInfoRequestBasketDto instance) {
  final val = <String, dynamic>{
    'basket': instance.basket,
    'delivery_id': instance.deliveryId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address_id', instance.addressId);
  return val;
}
