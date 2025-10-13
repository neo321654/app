import 'package:json_annotation/json_annotation.dart';

part 'code_sent_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class CodeSentDto {
  CodeSentDto({
    required this.message,
    this.expired,
  });
  final String message;
  final int? expired;

  factory CodeSentDto.fromJson(Map<String, dynamic> json) =>
      _$CodeSentDtoFromJson(json);
}
