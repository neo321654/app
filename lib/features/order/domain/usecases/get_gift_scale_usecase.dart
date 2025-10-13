import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/gifts_scale_entity.dart';
import '../repositories/order_repository.dart';

class GetGiftScaleUsecase
    implements UseCase<DataState<List<GiftsScaleEntity>>?, void> {
  final OrderRepository orderRepository;

  GetGiftScaleUsecase({required this.orderRepository});

  @override
  Future<DataState<List<GiftsScaleEntity>>> call({params}) {
    return orderRepository.getGiftsScale();
  }
}
