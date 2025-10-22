// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_profile_bonus_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketProfileBonusDto _$BasketProfileBonusDtoFromJson(
        Map<String, dynamic> json) =>
    BasketProfileBonusDto(
      totalBonus: (json['total_bonus'] as num).toInt(),
      availableBonus: (json['available_bonus'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BasketProfileBonusDtoToJson(
        BasketProfileBonusDto instance) =>
    <String, dynamic>{
      'total_bonus': instance.totalBonus,
      'available_bonus': instance.availableBonus,
    };
