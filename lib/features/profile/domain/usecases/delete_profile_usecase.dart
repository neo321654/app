import 'package:monobox/features/profile/domain/entities/delete_profile_entity.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/profile_repository.dart';

class DeleteProfileUsecase
    implements UseCase<DataState<DeleteProfileEntity>, void> {
  final ProfileRepository profileRepository;

  DeleteProfileUsecase({required this.profileRepository});

  @override
  Future<DataState<DeleteProfileEntity>> call({params}) {
    return profileRepository.deleteProfile();
  }
}
