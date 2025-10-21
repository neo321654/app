import 'package:monobox/features/more/data/data_source/remote/menu_api_service.dart';
import '../models/menu_response.dart';

abstract class MenuRemoteDataSource {
  Future<MenuResponse> getMenu();
}

class MenuRemoteDataSourceImpl implements MenuRemoteDataSource {
  final MenuApiService _menuApiService;

  MenuRemoteDataSourceImpl(this._menuApiService);

  @override
  Future<MenuResponse> getMenu() async {
    return await _menuApiService.getMenu();
  }
}
