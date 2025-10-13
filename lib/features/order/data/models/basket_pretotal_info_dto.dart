import 'package:json_annotation/json_annotation.dart';

part 'basket_pretotal_info_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class BasketPretotalnfoDto {
  BasketPretotalnfoDto({
    required this.title,
    required this.value,
  });

  final String? title;
  final String? value;

  factory BasketPretotalnfoDto.fromJson(Map<String, dynamic> json) =>
      _$BasketPretotalnfoDtoFromJson(json);
}
