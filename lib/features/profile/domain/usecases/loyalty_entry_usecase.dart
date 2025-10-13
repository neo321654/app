import 'package:monobox/features/profile/domain/entities/loyalty_entry_request_entity.dart';
import 'package:monobox/features/profile/domain/entities/loyalty_entry_response_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/loyalty_repository.dart';

class LoyaltyEntryUsecase
    implements
        UseCase<DataState<LoyaltyEntryResponseEntity>,
            LoyaltyEntryRequestEntity?> {
  final LoyaltyRepository repository;

  LoyaltyEntryUsecase({required this.repository});

  @override
  Future<DataState<LoyaltyEntryResponseEntity>> call({params}) {
    return repository.loyaltyEntry(params!);
  }
}
