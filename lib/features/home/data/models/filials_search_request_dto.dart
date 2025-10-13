import 'package:json_annotation/json_annotation.dart';
import 'package:monobox/features/home/data/models/coordinates_dto.dart';

part 'filials_search_request_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class FilialsSearchRequestDto {
  FilialsSearchRequestDto({
    this.cityId,
    this.address,
    this.coordinates,
  });
  final int? cityId;
  final String? address;
  @JsonKey(name: 'coords')
  final CoordinatesDto? coordinates;

  factory FilialsSearchRequestDto.fromJson(Map<String, dynamic> json) =>
      _$FilialsSearchRequestDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$FilialsSearchRequestDtoToJson(this);
  }

  @override
  String toString() {
    return "(cityId: $cityId, address: $address, coordinates: $coordinates, )";
  }
}
