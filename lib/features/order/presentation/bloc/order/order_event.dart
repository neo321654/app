part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class CreateOrder extends OrderEvent {
  final OrderCreateEntity order;
  const CreateOrder(this.order);
}

class CancelOrder extends OrderEvent {
  final int orderId;
  const CancelOrder(this.orderId);
}

class PayForOrder extends OrderEvent {
  final int orderId;
  const PayForOrder(this.orderId);
}
