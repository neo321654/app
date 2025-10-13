import 'package:json_annotation/json_annotation.dart';

part 'address_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class AddressDto {
  AddressDto({
    required this.id,
    required this.title,
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
    this.street,
    required this.isDefault,
  });

  final int id;
  final String title;
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
  final String? street;
  @JsonKey(name: 'default', defaultValue: false)
  final bool isDefault;

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$AddressDtoToJson(this);
  }
}
