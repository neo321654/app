// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promocode_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PromocodeDto _$PromocodeDtoFromJson(Map<String, dynamic> json) => PromocodeDto(
      code: json['code'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$PromocodeDtoToJson(PromocodeDto instance) {
  final val = <String, dynamic>{
    'code': instance.code,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  return val;
}
