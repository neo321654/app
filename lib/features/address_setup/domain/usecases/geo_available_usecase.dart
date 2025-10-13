import 'package:monobox/features/address_setup/domain/entities/geo_available_entity.dart';
import 'package:monobox/features/address_setup/domain/usecases/params/geolocate_address_params.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/geo_repository.dart';

class GeoavailableUsecase
    implements UseCase<DataState<GeoAvailableEntity>, GeolocateAddressParams?> {
  final GeoRepository repository;

  GeoavailableUsecase({required this.repository});

  @override
  Future<DataState<GeoAvailableEntity>> call({params}) {
    return repository.geoAvailable(params!.lat, params.lon);
  }
}
