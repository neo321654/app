import 'package:monobox/features/address_setup/domain/usecases/params/geo_suggestion_params.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/geo_suggestion_entity.dart';
import '../repository/geo_repository.dart';

class GeoSuggestionUsecase
    implements
        UseCase<DataState<List<GeoSuggestionEntity>>, GeoSuggestionParams?> {
  final GeoRepository repository;

  GeoSuggestionUsecase({required this.repository});

  @override
  Future<DataState<List<GeoSuggestionEntity>>> call({params}) {
    return repository.geoSuggestion(params!.city, params.search);
  }
}
