import 'package:monobox/features/order/domain/entities/payment_method_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/payment_repository.dart';
import '../datasources/remote/payment_api_service.dart';
import '../models/payment_methods_dto.dart';
import 'mappers/payment_mapper.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentApiService service;

  PaymentRepositoryImpl({required this.service});

  @override
  Future<DataState<List<PaymentMethodEntity>>?> getPaymentMethods(
      {int? deliveryId}) async {
    PaymentMethodsDto paymentMethods =
        await service.getPaymentMethods(deliveryId: deliveryId);

    return DataSuccess(
      PaymentMapper.toEntities(paymentMethods),
    );
  }
}
