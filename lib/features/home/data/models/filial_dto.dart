import 'package:json_annotation/json_annotation.dart';

part 'filial_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class FilialDto {
  FilialDto({
    required this.id,
    this.cityId,
    required this.name,
    required this.coordinates,
    this.timeDelay,
    this.distance,
    this.rezhim,
    this.rezhimToday,
    this.statusOpened,
    this.statusOpenedColor,
    this.startTodayTimestamp,
    this.endTodayTimestamp,
  });

  final int id;
  final int? cityId;
  @JsonKey(name: 'title')
  final String name;
  @JsonKey(fromJson: _timeDelayFromJson)
  final String? timeDelay;
  final String? distance;
  @JsonKey(name: 'coords')
  final FilialCoordinatesDto coordinates;
  final List<Map<String, dynamic>>? rezhim;
  @JsonKey(name: 'rezhim_today')
  final String? rezhimToday;
  @JsonKey(name: 'status_opened')
  final String? statusOpened;
  @JsonKey(name: 'status_opened_color')
  final String? statusOpenedColor;
  @JsonKey(name: 'start_today_timestamp')
  final int? startTodayTimestamp;
  @JsonKey(name: 'end_today_timestamp')
  final int? endTodayTimestamp;

  factory FilialDto.fromJson(Map<String, dynamic> json) =>
      _$FilialDtoFromJson(json);

  static String? _timeDelayFromJson(dynamic value) {
    if (value == null) return null;
    if (value is String) return value;
    if (value is int) return value.toString();
    throw FormatException('Expected a String or int for timeDelay, got $value');
  }
}

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class FilialCoordinatesDto {
  FilialCoordinatesDto({
    required this.lat,
    required this.lon,
  });

  @JsonKey(name: 'latitude', fromJson: _stringToDouble)
  final double lat;
  @JsonKey(name: 'longitude', fromJson: _stringToDouble)
  final double lon;

  factory FilialCoordinatesDto.fromJson(Map<String, dynamic> json) =>
      _$FilialCoordinatesDtoFromJson(json);

  static double _stringToDouble(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.parse(value);
    throw FormatException(
        'Expected a String or number for coordinate, got $value');
  }
}
