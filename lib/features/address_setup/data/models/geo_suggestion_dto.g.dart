// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_suggestion_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoSuggestionDto _$GeoSuggestionDtoFromJson(Map<String, dynamic> json) =>
    GeoSuggestionDto(
      value: json['value'] as String?,
      street: json['street'] as String?,
      streetType: json['street_type'] as String?,
      house: json['house'] as String?,
      block: json['block'] as String?,
      flat: json['flat'] as String?,
      geoLat: json['geo_lat'] as String?,
      geoLon: json['geo_lon'] as String?,
    );

Map<String, dynamic> _$GeoSuggestionDtoToJson(GeoSuggestionDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('value', instance.value);
  writeNotNull('street', instance.street);
  writeNotNull('street_type', instance.streetType);
  writeNotNull('house', instance.house);
  writeNotNull('block', instance.block);
  writeNotNull('flat', instance.flat);
  writeNotNull('geo_lat', instance.geoLat);
  writeNotNull('geo_lon', instance.geoLon);
  return val;
}
