import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/entities/delivery_entity.dart';

part 'deliveries_event.dart';
part 'deliveries_state.dart';

class DeliveryBloc extends Bloc<DeliveriesEvent, DeliveriesState> {
  final UseCase _deliveryUsecase;

  DeliveryBloc(this._deliveryUsecase) : super(DeliveriesInitial()) {
    on<GetDeliveries>(_onGetDeliveries);
  }

  void _onGetDeliveries(
      DeliveriesEvent event, Emitter<DeliveriesState> emit) async {
    print('DELIVERIES - STARTING LOAD');
    emit(const DeliveriesLoading());

    final DataState<List<DeliveryEntity>>? dataState = await _deliveryUsecase();

    if (dataState is DataSuccess && dataState?.data != null) {
      print('DELIVERIES LOADED: ${dataState!.data!.map((d) => '${d.id}:${d.name}(${d.type})').join(', ')}');
      emit(DeliveriesDone(dataState!.data ?? []));
    }

    if (dataState is DataFailed) {
      print('DELIVERIES - LOAD FAILED: ${dataState?.error?.message ?? 'Unknown error'}');
      emit(const DeliveriesError());
    }
  }
}
