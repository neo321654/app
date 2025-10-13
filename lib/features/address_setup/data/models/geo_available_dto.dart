import 'package:json_annotation/json_annotation.dart';
import 'package:monobox/features/home/data/models/filial_dto.dart';

part 'geo_available_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class GeoAvailableDto {
  GeoAvailableDto({
    required this.status,
    this.filial,
    this.message,
  });

  final String status;
  final FilialDto? filial;
  final String? message;

  factory GeoAvailableDto.fromJson(Map<String, dynamic> json) =>
      _$GeoAvailableDtoFromJson(json);

  // Map<String, dynamic> toJson() {
  //   return _$GeoAvailableRequestDtoToJson(this);
  // }
}
