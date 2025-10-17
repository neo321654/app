part of 'order_details_bloc.dart';

@freezed
class OrderDetailsEvent with _$OrderDetailsEvent {
  const factory OrderDetailsEvent.getOrder(int orderId) = _GetOrder;
  const factory OrderDetailsEvent.paymentCompleted(int orderId) =
      _PaymentCompleted;
}
