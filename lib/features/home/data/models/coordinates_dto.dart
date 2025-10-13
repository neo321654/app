import 'package:json_annotation/json_annotation.dart';

part 'coordinates_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class CoordinatesDto {
  CoordinatesDto({
    required this.lat,
    required this.lon,
  });
  @JsonKey(name: 'latitude')
  final double lat;
  @JsonKey(name: 'longitude')
  final double lon;

  factory CoordinatesDto.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$CoordinatesDtoToJson(this);
  }

  @override
  String toString() {
    return "(latitude: $lat, longitude: $lon)";
  }
}
