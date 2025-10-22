part of 'payment_methods_bloc.dart';

sealed class PaymentMethodsEvent {
  const PaymentMethodsEvent();
}

class GetPaymentMethods extends PaymentMethodsEvent {
  final int? deliveryId;
  const GetPaymentMethods({this.deliveryId});
}
