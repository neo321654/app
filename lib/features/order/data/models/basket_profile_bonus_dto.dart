import 'package:json_annotation/json_annotation.dart';

part 'basket_profile_bonus_dto.g.dart';

@JsonSerializable()
class BasketProfileBonusDto {
  const BasketProfileBonusDto({
    required this.totalBonus,
    this.availableBonus,
  });

  factory BasketProfileBonusDto.fromJson(Map<String, dynamic> json) =>
      _$BasketProfileBonusDtoFromJson(json);

  @JsonKey(name: 'total_bonus')
  final int totalBonus;
  @JsonKey(name: 'available_bonus')
  final int? availableBonus;

  Map<String, dynamic> toJson() => _$BasketProfileBonusDtoToJson(this);
}
