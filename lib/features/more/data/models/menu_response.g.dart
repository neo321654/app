// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) => MenuResponse(
      top: (json['top'] as List<dynamic>)
          .map((e) => MenuGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      footer_left: (json['footer_left'] as List<dynamic>)
          .map((e) => MenuGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      footer_right: (json['footer_right'] as List<dynamic>)
          .map((e) => MenuGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      mobile: (json['mobile'] as List<dynamic>)
          .map((e) => MenuGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuResponseToJson(MenuResponse instance) =>
    <String, dynamic>{
      'top': instance.top,
      'footer_left': instance.footer_left,
      'footer_right': instance.footer_right,
      'mobile': instance.mobile,
    };
