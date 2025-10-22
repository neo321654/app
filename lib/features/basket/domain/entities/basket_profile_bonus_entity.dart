import 'package:freezed_annotation/freezed_annotation.dart';

part 'basket_profile_bonus_entity.freezed.dart';

@freezed
class BasketProfileBonusEntity with _$BasketProfileBonusEntity {
  const factory BasketProfileBonusEntity({
    required int totalBonus,
    int? availableBonus,
  }) = _BasketProfileBonusEntity;
}
