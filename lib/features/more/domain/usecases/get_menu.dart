import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/models/menu_response.dart';
import '../../domain/repositories/menu_repository.dart';

class GetMenuUseCase implements UseCase<DataState<MenuResponse>, void> {
  final MenuRepository _menuRepository;

  GetMenuUseCase(this._menuRepository);

  @override
  Future<DataState<MenuResponse>> call({void params}) {
    return _menuRepository.getMenu();
  }
}
