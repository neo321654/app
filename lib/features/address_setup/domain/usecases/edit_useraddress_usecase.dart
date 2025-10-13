import 'package:monobox/features/address_setup/domain/entities/address_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/address_repository.dart';

class EditUserAddressesUsecase
    implements UseCase<DataState<void>, AddressEntity?> {
  final AddressRepository repository;

  EditUserAddressesUsecase({required this.repository});

  @override
  Future<DataState<void>> call({params}) {
    return repository.editAddress(params!);
  }
}
