import 'package:json_annotation/json_annotation.dart';

part 'payment_url_dto.g.dart';

@JsonSerializable()
class PaymentUrlDto {
  @JsonKey(name: 'payment_url')
  final String paymentUrl;

  PaymentUrlDto({required this.paymentUrl});

  factory PaymentUrlDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentUrlDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentUrlDtoToJson(this);
}
