// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketInfoDto _$BasketInfoDtoFromJson(Map<String, dynamic> json) =>
    BasketInfoDto(
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      totalInfo: BasketTotalInfoDto.fromJson(
          json['total_info'] as Map<String, dynamic>),
      pretotalInfo: (json['pretotal_info'] as List<dynamic>?)
              ?.map((e) =>
                  BasketPretotalnfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      bonusInfo: BasketPretotalnfoDto.fromJson(
          json['bonus_info'] as Map<String, dynamic>),
      warnings: (json['warnings'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      timeDelay: json['time_delay'] as String?,
      profileBonus: json['profile_bonus'] == null
          ? null
          : BasketProfileBonusDto.fromJson(
              json['profile_bonus'] as Map<String, dynamic>),
    );
