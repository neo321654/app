import 'package:json_annotation/json_annotation.dart';

part 'profile_bonus_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class ProfileBonusDto {
  ProfileBonusDto({
    this.count = 0.0,
    this.available = false,
    this.sumStill,
    this.currentStatus,
    this.nextStatus,
    this.numberCard,
  });

  final double count;
  final bool available;
  final String? sumStill;
  final String? currentStatus;
  final String? nextStatus;
  final String? numberCard;

  factory ProfileBonusDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileBonusDtoFromJson(json);
}
