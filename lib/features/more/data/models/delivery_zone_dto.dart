import 'package:json_annotation/json_annotation.dart';

part 'delivery_zone_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class DeliveryZoneDto {
  DeliveryZoneDto({
    required this.id,
    required this.title,
    required this.fill,
    required this.fillOpacity,
    required this.stroke,
    this.price,
    required this.polygon,
  });
  final int id;
  final String title;
  final String fill;
  final String fillOpacity;
  final String stroke;
  final String? price;
  final String polygon;

  factory DeliveryZoneDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryZoneDtoFromJson(json);
}
