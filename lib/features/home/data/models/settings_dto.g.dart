// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsDto _$SettingsDtoFromJson(Map<String, dynamic> json) => SettingsDto(
      socnet: json['socnet'] == null
          ? null
          : SocnetDto.fromJson(json['socnet'] as Map<String, dynamic>),
      pdf: json['pdf'] == null
          ? null
          : PdfDto.fromJson(json['pdf'] as Map<String, dynamic>),
      feedback: json['feedback'] == null
          ? null
          : FeedbackDto.fromJson(json['feedback'] as Map<String, dynamic>),
      monobox: json['monobox'] == null
          ? null
          : MonoboxDto.fromJson(json['monobox'] as Map<String, dynamic>),
      loyalty: json['loyalty'] as bool,
      children: json['children'] as bool?,
      callback: json['callback'] as bool?,
      usePromocode: json['use_promocode'] as bool?,
      useLoyalty: json['use_loyalty'] as bool?,
    );

SocnetDto _$SocnetDtoFromJson(Map<String, dynamic> json) => SocnetDto(
      vk: json['vk'] as String?,
      tg: json['tg'] as String?,
      insta: json['insta'] as String?,
    );

PdfDto _$PdfDtoFromJson(Map<String, dynamic> json) => PdfDto(
      politic: json['politic'] as String?,
    );

FeedbackDto _$FeedbackDtoFromJson(Map<String, dynamic> json) => FeedbackDto(
      phone: json['phone'] as String?,
      vk: json['vk'] as String?,
      tg: json['tg'] as String?,
      wa: json['wa'] as String?,
    );

MonoboxDto _$MonoboxDtoFromJson(Map<String, dynamic> json) => MonoboxDto(
      link: json['link'] as String?,
    );
