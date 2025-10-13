import 'package:json_annotation/json_annotation.dart';

part 'geo_suggestion_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class GeoSuggestionDto {
  GeoSuggestionDto({
    this.value,
    this.street,
    this.streetType,
    this.house,
    this.block,
    this.flat,
    this.geoLat,
    this.geoLon,
  });

  final String? value;
  final String? street;
  final String? streetType;
  final String? house;
  final String? block;
  final String? flat;
  final String? geoLat;
  final String? geoLon;

  factory GeoSuggestionDto.fromJson(Map<String, dynamic> json) =>
      _$GeoSuggestionDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$GeoSuggestionDtoToJson(this);
  }
}
