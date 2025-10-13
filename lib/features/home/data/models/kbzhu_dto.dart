import 'package:json_annotation/json_annotation.dart';

part 'kbzhu_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class KbzhuDto {
  KbzhuDto({
    required this.text,
  });

  final String text;

  factory KbzhuDto.fromJson(Map<String, dynamic> json) =>
      _$KbzhuDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$KbzhuDtoToJson(this);
  }
}
