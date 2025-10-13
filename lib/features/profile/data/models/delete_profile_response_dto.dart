import 'package:json_annotation/json_annotation.dart';

part 'delete_profile_response_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class DeleteProfileResponseDto {
  DeleteProfileResponseDto({
    required this.status,
  });

  final String status;

  factory DeleteProfileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$DeleteProfileResponseDtoFromJson(json);
}
