// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TagDto _$TagDtoFromJson(Map<String, dynamic> json) => TagDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      color: json['color'] as String,
      secondColor: json['second_color'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$TagDtoToJson(TagDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'color': instance.color,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('second_color', instance.secondColor);
  writeNotNull('icon', instance.icon);
  return val;
}
