// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filials_search_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilialsSearchRequestDto _$FilialsSearchRequestDtoFromJson(
        Map<String, dynamic> json) =>
    FilialsSearchRequestDto(
      cityId: (json['city_id'] as num?)?.toInt(),
      address: json['address'] as String?,
      coordinates: json['coords'] == null
          ? null
          : CoordinatesDto.fromJson(json['coords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FilialsSearchRequestDtoToJson(
    FilialsSearchRequestDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('city_id', instance.cityId);
  writeNotNull('address', instance.address);
  writeNotNull('coords', instance.coordinates);
  return val;
}
