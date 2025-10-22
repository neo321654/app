import '../../../../core/resources/data_state.dart';
import '../entities/payment_method_entity.dart';

abstract class PaymentRepository {
  Future<DataState<List<PaymentMethodEntity>>?> getPaymentMethods(
      {int? deliveryId});
}
