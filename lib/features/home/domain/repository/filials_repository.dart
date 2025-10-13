import 'package:monobox/features/home/domain/entities/filials_search_request_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../more/domain/entities/shop_entity.dart';
import '../entities/city_entity.dart';

abstract class FilialsRepository {
  Future<DataState<List<CityEntity>>> getCities();
  Future<DataState<List<ShopEntity>>> getFilials();
  Future<DataState<List<ShopEntity>>> searchFilials(
      FilialsSearchRequesEntity request);
}
