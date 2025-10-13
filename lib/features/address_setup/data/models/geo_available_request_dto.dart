import 'package:json_annotation/json_annotation.dart';
import 'package:monobox/features/home/data/models/coordinates_dto.dart';

part 'geo_available_request_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class GeoAvailableRequestDto {
  GeoAvailableRequestDto({
    required this.coords,
  });

  final CoordinatesDto coords;

  factory GeoAvailableRequestDto.fromJson(Map<String, dynamic> json) =>
      _$GeoAvailableRequestDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$GeoAvailableRequestDtoToJson(this);
  }
}
