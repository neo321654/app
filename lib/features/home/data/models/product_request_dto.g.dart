// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRequestDto _$ProductRequestDtoFromJson(Map<String, dynamic> json) =>
    ProductRequestDto(
      search: json['search'] as String?,
      filters: json['filters'] == null
          ? null
          : FilterDto.fromJson(json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductRequestDtoToJson(ProductRequestDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('search', instance.search);
  writeNotNull('filters', instance.filters);
  return val;
}
