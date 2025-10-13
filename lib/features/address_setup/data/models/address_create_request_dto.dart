import 'package:json_annotation/json_annotation.dart';

part 'address_create_request_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class AddressCreateRequestDto {
  AddressCreateRequestDto({
    required this.title,
    required this.street,
    this.comment,
    this.zipcode,
    this.country,
    this.region,
    this.city,
    this.house,
    this.building,
    this.entrance,
    this.floor,
    this.appartment,
    this.kladrId,
    this.uid,
    this.domofon,
    this.cityId,
    this.latitude,
    this.longitude,
  });

  final String title;
  final String street;
  final String? comment;
  final String? zipcode;
  final String? country;
  final String? region;
  final String? city;
  final String? house;
  final String? building;
  final String? entrance;
  final String? floor;
  final String? appartment;
  final String? kladrId;
  final String? uid;
  final String? domofon;
  final double? latitude;
  final double? longitude;
  final int? cityId;

  factory AddressCreateRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AddressCreateRequestDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$AddressCreateRequestDtoToJson(this);
  }
}
