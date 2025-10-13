import 'package:json_annotation/json_annotation.dart';

part 'loyalty_entry_response_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class LoyaltyEntryResponseDto {
  LoyaltyEntryResponseDto({
    required this.status,
    required this.message,
  });

  final String status;
  final String message;

  factory LoyaltyEntryResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoyaltyEntryResponseDtoFromJson(json);
}
