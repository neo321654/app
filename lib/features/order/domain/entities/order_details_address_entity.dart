import 'package:equatable/equatable.dart';

class OrderDetailsAddressEntity extends Equatable {
  const OrderDetailsAddressEntity({
    required this.id,
    this.title,
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
  });

  final int id;
  final String? title;
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

  /// Составной адрес в одну строку
  String get fullAddress {
    final parts = [
      country,
      region,
      city,
      house,
      building,
      entrance != null ? 'подъезд $entrance' : null,
      floor != null ? '$floor эт.' : null,
      appartment != null ? 'кв. $appartment' : null,
    ].where((e) => e != null && e.isNotEmpty).join(', ');
    return parts.isNotEmpty ? parts : (title ?? '');
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
        domofon
      ];
}
