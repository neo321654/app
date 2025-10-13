// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_info_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketInfoRequestDto _$BasketInfoRequestDtoFromJson(
        Map<String, dynamic> json) =>
    BasketInfoRequestDto(
      id: (json['id'] as num).toInt(),
      qnt: (json['qnt'] as num).toInt(),
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map(
                  (e) => BasketModifireDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BasketInfoRequestDtoToJson(
    BasketInfoRequestDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'qnt': instance.qnt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('modifiers', instance.modifiers);
  return val;
}
