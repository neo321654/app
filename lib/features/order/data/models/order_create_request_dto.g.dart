// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_create_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCreateRequestDto _$OrderCreateRequestDtoFromJson(
        Map<String, dynamic> json) =>
    OrderCreateRequestDto(
      products: (json['products'] as List<dynamic>)
          .map((e) => OrderProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentId: (json['payment_id'] as num).toInt(),
      deliveryId: (json['delivery_id'] as num).toInt(),
      filialId: (json['filial_id'] as num?)?.toInt(),
      addressId: (json['address_id'] as num?)?.toInt(),
      completeBefore: json['complete_before'] as String?,
      remoteDelivery: json['remote_delivery'] as bool? ?? false,
      moneyChange: json['money_change'] as String?,
      orderComment: json['order_comment'] as String?,
      needCall: json['need_call'] as bool?,
      promocode: json['promocode'] as String?,
      bonusWithdraw: json['bonus_withdraw'] as String?,
      gifts: (json['gifts'] as List<dynamic>?)
          ?.map((e) => OrderProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderCreateRequestDtoToJson(
    OrderCreateRequestDto instance) {
  final val = <String, dynamic>{
    'payment_id': instance.paymentId,
    'delivery_id': instance.deliveryId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address_id', instance.addressId);
  writeNotNull('filial_id', instance.filialId);
  val['products'] = instance.products;
  writeNotNull('gifts', instance.gifts);
  writeNotNull('complete_before', instance.completeBefore);
  val['remote_delivery'] = instance.remoteDelivery;
  writeNotNull('need_call', instance.needCall);
  writeNotNull('money_change', instance.moneyChange);
  writeNotNull('order_comment', instance.orderComment);
  writeNotNull('promocode', instance.promocode);
  writeNotNull('bonus_withdraw', instance.bonusWithdraw);
  return val;
}

OrderProductDto _$OrderProductDtoFromJson(Map<String, dynamic> json) =>
    OrderProductDto(
      id: (json['id'] as num).toInt(),
      quantity: (json['qnt'] as num).toInt(),
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map(
                  (e) => BasketModifireDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OrderProductDtoToJson(OrderProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'qnt': instance.quantity,
      'modifiers': instance.modifiers,
    };

OrderCustomerDto _$OrderCustomerDtoFromJson(Map<String, dynamic> json) =>
    OrderCustomerDto(
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      birthdate: json['birthdate'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$OrderCustomerDtoToJson(OrderCustomerDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phone', instance.phone);
  writeNotNull('name', instance.name);
  writeNotNull('surname', instance.surname);
  writeNotNull('birthdate', instance.birthdate);
  writeNotNull('email', instance.email);
  return val;
}

OrderAddressDto _$OrderAddressDtoFromJson(Map<String, dynamic> json) =>
    OrderAddressDto(
      coords: json['coords'] == null
          ? null
          : OrderAddressCoordsDto.fromJson(
              json['coords'] as Map<String, dynamic>),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$OrderAddressDtoToJson(OrderAddressDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('coords', instance.coords);
  writeNotNull('comment', instance.comment);
  return val;
}

OrderAddressCoordsDto _$OrderAddressCoordsDtoFromJson(
        Map<String, dynamic> json) =>
    OrderAddressCoordsDto(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderAddressCoordsDtoToJson(
        OrderAddressCoordsDto instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
