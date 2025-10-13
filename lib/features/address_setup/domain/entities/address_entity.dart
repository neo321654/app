import 'package:freezed_annotation/freezed_annotation.dart';
part 'address_entity.freezed.dart';

@freezed
class AddressEntity with _$AddressEntity {
  const AddressEntity._();
  const factory AddressEntity({
    required int id,
    required String title,
    final String? zipcode,
    final String? country,
    final String? region,
    final String? city,
    final String? house,
    final String? building,
    final String? entrance,
    final String? floor,
    final String? appartment,
    final String? kladrId,
    final String? uid,
    final String? domofon,
    final String? comment,
    final String? street,
    @Default(false) final bool isDefault,
  }) = _AddressEntity;

  String get address => _getAddress();

  String _getAddress() {
    return (street?.isNotEmpty == true ? street! : title) +
        ((street?.isNotEmpty == true && house?.isNotEmpty == true)
            ? ' д. $house'
            : '') +
        (appartment?.isNotEmpty == true ? ' кв. $appartment' : '');
  }
}
/*

class AddressEntity extends Equatable {
  const AddressEntity({
    required this.id,
    required this.title,
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
    this.isDefault = false,
  });

  final int id;
  final String title;
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
  final bool isDefault;

  String get address => _getAddress();

  String _getAddress() {
    return title + (entrance != null ? ' кв. $entrance' : '');
  }

  @override
  List<Object?> get props => [
        id,
        title,
        zipcode,
        country,
        region,
        city,
        house,
        building,
        entrance,
        floor,
        appartment,
        kladrId,
        uid,
        domofon,
      ];
}
*/
