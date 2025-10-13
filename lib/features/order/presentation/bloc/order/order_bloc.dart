import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/delivery_entity.dart';
import '../../../domain/entities/order_created_entity.dart';
import '../../../domain/entities/order_create_entity.dart';
import '../../../domain/entities/ordered_position_entity.dart';
import '../../../domain/entities/payment_method_entity.dart';
import '../../../domain/usecases/create_order_usecase.dart';
import '../../../domain/usecases/delete_order_usecase.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final CreateOrderUsecase _createOrderUsecase;
  final DeleteOrderUsecase _deleteOrderUsecase;

  OrderBloc(
    this._createOrderUsecase,
    this._deleteOrderUsecase,
  ) : super(OrderInitial()) {
    on<CreateOrder>(_onCreateOrder);
    on<CancelOrder>(_onCancelOrder);
  }

  void _onCreateOrder(CreateOrder event, Emitter<OrderState> emit) async {
    try {
      emit(const OrderCreating());

      final DataState<OrderCreatedEntity>? dataState =
          await _createOrderUsecase.call(params: event.order);

      if (dataState is DataSuccess && dataState?.data != null) {
        emit(OrderCreated(dataState!.data!));
      }

      if (dataState is DataFailed) {
        emit(OrderError(
          StateError(dataState?.error?.message ?? ''),
        ));
      }
    } on SocketException {
      emit(OrderError(
        StateError('Ошибка'),
      ));
    } catch (e) {
      emit(OrderError(
        StateError('Ошибка'),
      ));
    }
  }

  void createOrder(OrderCreateEntity offer) {
    add(
      CreateOrder(
        offer,
      ),
    );
  }

  OrderCreateEntity offer({
    required PaymentMethodEntity paymentMethod,
    required DeliveryEntity delivery,
    required List<OrderedPositionEntity> orderedPositions,
    int? filialId,
    int? addressId,
    String? moneyChange,
    List<OrderedPositionEntity>? gifts,
    String? completeBefore,
    bool remoteDelivery = false,
    String? promocode,
    bool? needCall,
    String? bonusWithdraw,
    String? orderComment,
  }) {
    return OrderCreateEntity(
      paymentId: paymentMethod.id,
      deliveryId: delivery.id,
      orderedPositions: orderedPositions,
      addressId: addressId,
      filialId: filialId,
      moneyChange: moneyChange,
      gifts: gifts,
      completeBefore: completeBefore,
      remoteDelivery: remoteDelivery,
      promocode: promocode,
      needCall: needCall,
      bonusWithdraw: bonusWithdraw,
      comment: orderComment,
    );
  }

  void _onCancelOrder(CancelOrder event, Emitter<OrderState> emit) async {
    try {
      await _deleteOrderUsecase.call(params: event.orderId);

      emit(OrderCanceled(event.orderId));
    } on SocketException {
      emit(OrderError(
        StateError('Ошибка'),
      ));
    } catch (e) {
      emit(OrderError(
        StateError('Ошибка'),
      ));
    }
  }
}
