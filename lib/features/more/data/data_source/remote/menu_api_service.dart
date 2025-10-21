import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../models/menu_response.dart';

part 'menu_api_service.g.dart';

@RestApi()
abstract class MenuApiService {
  factory MenuApiService(Dio dio) = _MenuApiService;

  @GET('/pages/menu_links')
  Future<MenuResponse> getMenu();
}
