import '../../../../../core/resources/data_state.dart';
import '../../../../../core/usecase/usecase.dart';
import '../repositories/order_repository.dart';

class GetPaymentUrlUsecase implements UseCase<DataState<String>, int> {
  GetPaymentUrlUsecase(this._orderRepository);

  final OrderRepository _orderRepository;

  @override
  Future<DataState<String>> call({int? params}) {
    return _orderRepository.getPaymentUrl(params!);
  }
}
