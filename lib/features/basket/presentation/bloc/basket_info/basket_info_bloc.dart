import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monobox/core/resources/data_state.dart';
import 'package:monobox/features/basket/domain/entities/basket_info_entity.dart';
import 'package:monobox/features/basket/domain/entities/basket_info_request_entity.dart';
import 'package:monobox/features/basket/domain/entities/basket_request.dart';
import 'package:monobox/features/basket/domain/usecases/get_basket_info_usecase.dart';

part 'basket_info_event.dart';
part 'basket_info_state.dart';
part 'basket_info_bloc.freezed.dart';

class BasketInfoBloc extends Bloc<BasketInfoEvent, BasketInfoState> {
  BasketInfoBloc(this._getBasketInfoUsecase) : super(const _Initial()) {
    on<_GetBasketInfo>(_onGetBasketInfo);
  }

  final GetBasketInfoUsecase _getBasketInfoUsecase;

  void _onGetBasketInfo(
    BasketInfoEvent event,
    Emitter<BasketInfoState> emit,
  ) async {
    try {
      emit(const BasketInfoState.loading());

      print('BASKET INFO BLOC - REQUEST: ${event.request.length} items');
      print('BASKET INFO BLOC - DELIVERY ID: ${event.deliveryId}');
      
      final dataState = await _getBasketInfoUsecase(
          params: BasketRequest(
        baket: event.request,
        deliveryId: event.deliveryId ?? 0,
      ));

      if (dataState is DataSuccess && dataState.data != null) {
        emit(BasketInfoState.success(dataState.data!));
      }

      if (dataState is DataFailed) {
        emit(
          BasketInfoState.error(
            dataState.error?.message ?? '',
          ),
        );
      }
    } catch (e, stackTrace) {
      print('Error: $e');
      print('Stack trace: $stackTrace');
      emit(BasketInfoState.error(e.toString()));
    }
  }
}
