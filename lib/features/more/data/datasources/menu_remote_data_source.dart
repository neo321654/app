import 'package:dio/dio.dart';
import '../models/menu_response.dart';

abstract class MenuRemoteDataSource {
  Future<MenuResponse> getMenu();
}

class MenuRemoteDataSourceImpl implements MenuRemoteDataSource {
  final Dio dio;

  MenuRemoteDataSourceImpl({required this.dio});

  @override
  Future<MenuResponse> getMenu() async {
    final response =
        await dio.get('https://admin.monobox.app/api/v1/pages/menu_links');
    if (response.statusCode == 200) {
      return MenuResponse.fromJson(response.data);
    } else {
      throw Exception('Failed to load menu');
    }
  }
}
