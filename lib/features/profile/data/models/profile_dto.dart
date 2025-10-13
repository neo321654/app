import 'package:json_annotation/json_annotation.dart';

import 'profile_address_dto.dart';
import 'profile_bonus_dto.dart';
import 'profile_card_dto.dart';
import 'profile_child_dto.dart';
import 'user_dto.dart';

part 'profile_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class ProfileDto {
  ProfileDto({
    required this.user,
    this.addresses = const [],
    this.children = const [],
    this.cards = const [],
    required this.bonus,
  });
  final UserDto user;
  final List<ProfileAddressDto> addresses;
  final List<ProfileChildDto> children;
  final List<ProfileCardDto> cards;
  final ProfileBonusDto? bonus;

  factory ProfileDto.fromJson(Map<String, dynamic> json) =>
      _$ProfileDtoFromJson(json);
}
