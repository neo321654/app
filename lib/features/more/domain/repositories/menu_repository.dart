import '../../../../core/resources/data_state.dart';
import '../../data/models/menu_response.dart';

abstract class MenuRepository {
  Future<DataState<MenuResponse>> getMenu();
}
