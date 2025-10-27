// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhraseModelImpl _$$PhraseModelImplFromJson(Map<String, dynamic> json) =>
    _$PhraseModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$PhraseModelImplToJson(_$PhraseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'icon': instance.icon,
    };
