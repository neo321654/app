import 'package:json_annotation/json_annotation.dart';

part 'loyalty_entry_request_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class LoyaltyEntryRequestDto {
  LoyaltyEntryRequestDto({
    required this.name,
    required this.email,
    required this.birthdate,
  });

  final String name;
  final String email;
  final String birthdate;

  factory LoyaltyEntryRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyEntryRequestDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$LoyaltyEntryRequestDtoToJson(this);
  }
}
