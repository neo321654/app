import 'package:json_annotation/json_annotation.dart';

part 'action_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class ActionDto {
  ActionDto({
    required this.id,
    required this.title,
    this.content,
    this.description,
    this.dopText,
    this.picture,
    this.mobilePicture,
  });

  final int id;
  final String title;
  final String? content;
  final String? description;
  final String? dopText;
  final String? picture;
  final String? mobilePicture;

  factory ActionDto.fromJson(Map<String, dynamic> json) =>
      _$ActionDtoFromJson(json);
}
