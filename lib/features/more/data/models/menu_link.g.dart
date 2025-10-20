// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuLink _$MenuLinkFromJson(Map<String, dynamic> json) => MenuLink(
      title: json['title'] as String,
      link: json['link'] as String,
      icon: json['icon'] as String?,
      target: json['target'] as String?,
    );

Map<String, dynamic> _$MenuLinkToJson(MenuLink instance) => <String, dynamic>{
      'title': instance.title,
      'link': instance.link,
      'icon': instance.icon,
      'target': instance.target,
    };
