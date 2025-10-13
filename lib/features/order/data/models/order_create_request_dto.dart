import 'package:json_annotation/json_annotation.dart';

import 'basket_modifire_dto.dart';

part 'order_create_request_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class OrderCreateRequestDto {
  OrderCreateRequestDto({
    required this.products,
    required this.paymentId,
    required this.deliveryId,
    this.filialId,
    this.addressId,
    this.completeBefore,
    required this.remoteDelivery,
    this.moneyChange,
    //required this.customer,
    //this.address,
    required this.orderComment,
    this.needCall,
    this.promocode,
    this.bonusWithdraw,
    this.gifts,
  });

  final int paymentId;
  final int deliveryId;
  final int? addressId;
  final int? filialId;
  final List<OrderProductDto> products;
  final List<OrderProductDto>? gifts;
  final String? completeBefore;
  @JsonKey(defaultValue: false)
  final bool remoteDelivery;
  final bool? needCall;
  final String? moneyChange;
  //final OrderCustomerDto? customer;
  //final OrderAddressDto? address;
  final String? orderComment;
  final String? promocode;
  final String? bonusWithdraw;

  factory OrderCreateRequestDto.fromJson(Map<String, dynamic> json) =>
      _$OrderCreateRequestDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$OrderCreateRequestDtoToJson(this);
  }
}

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class OrderProductDto {
  OrderProductDto({
    required this.id,
    required this.quantity,
    this.modifiers = const [],
  });

  final int id;
  @JsonKey(name: 'qnt')
  final int quantity;
  final List<BasketModifireDto> modifiers;

  factory OrderProductDto.fromJson(Map<String, dynamic> json) =>
      _$OrderProductDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$OrderProductDtoToJson(this);
  }

  @override
  String toString() {
    return "(id: $id, qnt: $quantity, modifiers: $modifiers)";
  }
}

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class OrderCustomerDto {
  OrderCustomerDto({
    this.phone,
    this.name,
    this.surname,
    this.birthdate,
    this.email,
  });

  final String? phone;
  final String? name;
  final String? surname;
  final String? birthdate;
  final String? email;

  factory OrderCustomerDto.fromJson(Map<String, dynamic> json) =>
      _$OrderCustomerDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$OrderCustomerDtoToJson(this);
  }
}

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class OrderAddressDto {
  OrderAddressDto({
    this.coords,
    this.comment,
  });
  final OrderAddressCoordsDto? coords;
  final String? comment;

  factory OrderAddressDto.fromJson(Map<String, dynamic> json) =>
      _$OrderAddressDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$OrderAddressDtoToJson(this);
  }
}

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class OrderAddressCoordsDto {
  OrderAddressCoordsDto({
    required this.x,
    required this.y,
  });
  final double x;
  final double y;

  factory OrderAddressCoordsDto.fromJson(Map<String, dynamic> json) =>
      _$OrderAddressCoordsDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$OrderAddressCoordsDtoToJson(this);
  }
}
