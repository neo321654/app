// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeRequestDto _$CodeRequestDtoFromJson(Map<String, dynamic> json) =>
    CodeRequestDto(
      phoneNumber: json['phoneNumber'] as String,
      code: json['code'] as String?,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$CodeRequestDtoToJson(CodeRequestDto instance) {
  final val = <String, dynamic>{
    'phoneNumber': instance.phoneNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('deviceId', instance.deviceId);
  return val;
}
