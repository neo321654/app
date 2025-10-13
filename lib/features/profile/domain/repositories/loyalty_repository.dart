import 'package:monobox/features/profile/domain/entities/loyalty_entry_request_entity.dart';
import 'package:monobox/features/profile/domain/entities/loyalty_entry_response_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../entities/loyalty_entity.dart';

abstract class LoyaltyRepository {
  Future<DataState<List<LoyaltyEntity>>> loyaltyInfo();
  Future<DataState<LoyaltyEntryResponseEntity>> loyaltyEntry(
      LoyaltyEntryRequestEntity request);
}
