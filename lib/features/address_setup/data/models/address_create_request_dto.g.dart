// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_create_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressCreateRequestDto _$AddressCreateRequestDtoFromJson(
        Map<String, dynamic> json) =>
    AddressCreateRequestDto(
      title: json['title'] as String,
      street: json['street'] as String,
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
      cityId: (json['city_id'] as num?)?.toInt(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AddressCreateRequestDtoToJson(
    AddressCreateRequestDto instance) {
  final val = <String, dynamic>{
    'title': instance.title,
    'street': instance.street,
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
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('city_id', instance.cityId);
  return val;
}
