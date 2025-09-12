import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monobox/features/order/domain/entities/order_entity.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/usecases/get_orders_usecase.dart';

part 'orders_list_event.dart';
part 'orders_list_state.dart';
part 'orders_list_bloc.freezed.dart';

class OrdersListBloc extends Bloc<OrdersListEvent, OrdersListState> {
  OrdersListBloc(this._getOrdersUsecase) : super(const Initial()) {
    on<_GetOrders>(_onGetOrders);
  }

  final GetOrdersUsecase _getOrdersUsecase;

  void _onGetOrders(
    OrdersListEvent event,
    Emitter<OrdersListState> emit,
  ) async {
    try {
      print('ORDERS LIST - LOADING ORDERS...');
      emit(const OrdersListState.loading());

      final dataState = await _getOrdersUsecase();

      if (dataState is DataSuccess && dataState.data != null) {
        print('ORDERS LIST - SUCCESS: ${dataState.data!.length} orders loaded');
        emit(OrdersListState.success(dataState.data!));
      }

      if (dataState is DataFailed) {
        print('ORDERS LIST - ERROR: ${dataState.error?.message}');
        emit(
          OrdersListState.error(
            dataState.error?.message ?? '',
          ),
        );
      }
    } catch (e, stackTrace) {
      print('ORDERS LIST - EXCEPTION: $e');
      print('ORDERS LIST - STACKTRACE: $stackTrace');
      emit(
        OrdersListState.error(
          '$e',
        ),
      );
    }
  }
}
