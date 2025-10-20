// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuGroup _$MenuGroupFromJson(Map<String, dynamic> json) => MenuGroup(
      title: json['title'] as String,
      links: (json['links'] as List<dynamic>)
          .map((e) => MenuLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuGroupToJson(MenuGroup instance) => <String, dynamic>{
      'title': instance.title,
      'links': instance.links,
    };
