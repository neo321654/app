import 'package:dio/dio.dart';
import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/menu_repository.dart';
import '../datasources/menu_remote_data_source.dart';
import '../models/menu_response.dart';

class MenuRepositoryImpl implements MenuRepository {
  final MenuRemoteDataSource remoteDataSource;

  MenuRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DataState<MenuResponse>> getMenu() async {
    try {
      final menu = await remoteDataSource.getMenu();
      return DataSuccess(menu);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
