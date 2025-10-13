// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => AddressDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      comment: json['comment'] as String?,
      zipcode: json['zipcode'] as String?,
      country: json['country'] as String?,
      region: json['region'] as String?,
      city: json['city'] as String?,
      house: json['house'] as String?,
      building: json['building'] as String?,
      entrance: json['entrance'] as String?,
      floor: json['floor'] as String?,
      appartment: json['appartment'] as String?,
      kladrId: json['kladr_id'] as String?,
      uid: json['uid'] as String?,
      domofon: json['domofon'] as String?,
      street: json['street'] as String?,
      isDefault: json['default'] as bool? ?? false,
    );

Map<String, dynamic> _$AddressDtoToJson(AddressDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comment', instance.comment);
  writeNotNull('zipcode', instance.zipcode);
  writeNotNull('country', instance.country);
  writeNotNull('region', instance.region);
  writeNotNull('city', instance.city);
  writeNotNull('house', instance.house);
  writeNotNull('building', instance.building);
  writeNotNull('entrance', instance.entrance);
  writeNotNull('floor', instance.floor);
  writeNotNull('appartment', instance.appartment);
  writeNotNull('kladr_id', instance.kladrId);
  writeNotNull('uid', instance.uid);
  writeNotNull('domofon', instance.domofon);
  writeNotNull('street', instance.street);
  val['default'] = instance.isDefault;
  return val;
}
