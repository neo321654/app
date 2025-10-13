import 'package:monobox/features/home/domain/entities/filials_search_request_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../more/domain/entities/shop_entity.dart';
import '../repository/filials_repository.dart';

class SearchFilialsUsecase
    implements
        UseCase<DataState<List<ShopEntity>>, FilialsSearchRequesEntity?> {
  final FilialsRepository repository;

  SearchFilialsUsecase({required this.repository});

  @override
  Future<DataState<List<ShopEntity>>> call({params}) {
    return repository.searchFilials(params!);
  }
}
