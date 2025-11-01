// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsDto _$OrderDetailsDtoFromJson(Map<String, dynamic> json) =>
    OrderDetailsDto(
      id: (json['id'] as num).toInt(),
      number: (json['number'] as num?)?.toInt(),
      status: json['status'] as String,
      totalPrice: (json['total_price'] as num).toDouble(),
      createdAt: json['created_at'] as String,
      comment: json['comment'] as String?,
      delivery: DeliveryDto.fromJson(json['delivery'] as Map<String, dynamic>),
      payment:
          PaymentMethodDto.fromJson(json['payment'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>)
          .map((e) => OrderProductDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentStatus: json['payment_status'] as bool,
      needReview: json['need_review'] as bool,
      address: json['address'] == null
          ? null
          : OrderDetailsAddressDto.fromJson(
              json['address'] as Map<String, dynamic>),
      statuses: (json['order_statuses'] as List<dynamic>?)
              ?.map((e) =>
                  OrderDetailsStatusDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cancelled: json['cancelled'] as bool?,
    );
