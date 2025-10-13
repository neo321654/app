import 'package:json_annotation/json_annotation.dart';

part 'order_details_status_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class OrderDetailsStatusDto {
  OrderDetailsStatusDto({
    required this.id,
    this.title,
    this.subtitle,
    required this.active,
    required this.date,
  });

  final int id;
  final String? title;
  final String? subtitle;
  @JsonKey(defaultValue: false)
  final bool active;
  final String? date;

  factory OrderDetailsStatusDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsStatusDtoFromJson(json);
}
