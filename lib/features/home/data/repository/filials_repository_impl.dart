import 'package:dio/dio.dart';
import 'package:monobox/core/resources/data_state.dart';
import 'package:monobox/features/home/data/models/coordinates_dto.dart';
import 'package:monobox/features/home/data/models/filials_search_request_dto.dart';

import 'package:monobox/features/home/domain/entities/city_entity.dart';
import 'package:monobox/features/home/domain/entities/filials_search_request_entity.dart';

import 'package:monobox/features/more/domain/entities/shop_entity.dart';

import '../../domain/repository/filials_repository.dart';
import '../data_sources/remote/filials_api_service.dart';
import '../models/city_dto.dart';
import '../models/filial_dto.dart';
import 'mappers/city_mapper.dart';
import 'mappers/filial_mapper.dart';

class FilialsRepositoryImpl extends FilialsRepository {
  final FilialsApiService service;

  FilialsRepositoryImpl({required this.service});

  @override
  Future<DataState<List<CityEntity>>> getCities() async {
    try {
      List<CityDto> cities = await service.getCities();
      return DataSuccess(
        CityMapper.toEntities(cities),
      );
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<ShopEntity>>> getFilials() async {
    try {
      List<FilialDto> filials = await service.getFilials();
      return DataSuccess(
        FilialMapper.toEntities(filials),
      );
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<ShopEntity>>> searchFilials(
      FilialsSearchRequesEntity request) async {
    try {
      List<FilialDto> filials =
          await service.searchFilials(FilialsSearchRequestDto(
        cityId: request.cityId,
        address: request.address,
        coordinates: request.coordinates != null
            ? CoordinatesDto(
                lat: request.coordinates!.lat,
                lon: request.coordinates!.lon,
              )
            : null,
      ));
      return DataSuccess(
        FilialMapper.toEntities(filials),
      );
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
