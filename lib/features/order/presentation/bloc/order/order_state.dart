part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderCreating extends OrderState {
  const OrderCreating();
}

class OrderCreated extends OrderState {
  final OrderCreatedEntity created;

  const OrderCreated(this.created);
}

class OrderCanceled extends OrderState {
  final int orderId;
  const OrderCanceled(this.orderId);
}

class OrderError extends OrderState {
  final Error error;
  const OrderError(this.error);
}

class OrderPaymentUrlReady extends OrderState {
  final String paymentUrl;
  const OrderPaymentUrlReady(this.paymentUrl);
}
