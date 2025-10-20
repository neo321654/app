// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) => MenuResponse(
      top: (json['top'] as List<dynamic>)
          .map((e) => MenuGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      footerLeft: (json['footerLeft'] as List<dynamic>)
          .map((e) => MenuGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      footerRight: (json['footerRight'] as List<dynamic>)
          .map((e) => MenuGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      mobile: (json['mobile'] as List<dynamic>)
          .map((e) => MenuGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuResponseToJson(MenuResponse instance) =>
    <String, dynamic>{
      'top': instance.top,
      'footerLeft': instance.footerLeft,
      'footerRight': instance.footerRight,
      'mobile': instance.mobile,
    };
