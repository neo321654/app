import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entities/order_details_entity.dart';
import '../../../domain/usecases/get_order_usecase.dart';

part 'order_details_event.dart';
part 'order_details_state.dart';
part 'order_details_bloc.freezed.dart';

class OrderDetailsBloc extends Bloc<OrderDetailsEvent, OrderDetailsState> {
  OrderDetailsBloc(this._getOrderUsecase) : super(const Initial()) {
    on<_GetOrder>(_onGetOrder);
    on<_PaymentCompleted>(_onPaymentCompleted);
  }

  final GetOrderUsecase _getOrderUsecase;

  void _onPaymentCompleted(
    _PaymentCompleted event,
    Emitter<OrderDetailsState> emit,
  ) async {
    final currentState = state;
    if (currentState is Success) {
      final updatedOrder = currentState.order.copyWith(paymentStatus: true);
      emit(OrderDetailsState.success(updatedOrder));
    }
  }

  void _onGetOrder(
    OrderDetailsEvent event,
    Emitter<OrderDetailsState> emit,
  ) async {
    try {
      emit(const OrderDetailsState.loading());

      final dataState = await _getOrderUsecase.call(params: event.orderId);

      if (dataState is DataSuccess && dataState.data != null) {
        emit(OrderDetailsState.success(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(
          OrderDetailsState.error(
            dataState.error?.message ?? '',
          ),
        );
      }
    } catch (e, stackTrace) {
      print('Исключение: $e');
      print('StackTrace: $stackTrace');
      emit(
        OrderDetailsState.error(
          '$e',
        ),
      );
    }
  }
}
