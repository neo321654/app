import 'package:dio/dio.dart';
import 'package:monobox/core/resources/data_state.dart';
import 'package:monobox/features/address_setup/data/models/geo_available_dto.dart';
import 'package:monobox/features/address_setup/data/models/geo_available_request_dto.dart';
import 'package:monobox/features/address_setup/domain/entities/geo_available_entity.dart';

import 'package:monobox/features/address_setup/domain/entities/geo_suggestion_entity.dart';
import 'package:monobox/features/home/data/models/coordinates_dto.dart';
import 'package:monobox/features/home/data/repository/mappers/filial_mapper.dart';

import '../../domain/repository/geo_repository.dart';
import '../data_sources/remote/geo_api_service.dart';
import '../models/geo_suggestion_dto.dart';
import '../models/geo_suggestion_request_dto.dart';

class GeoRepositoryImpl implements GeoRepository {
  final GeoApiService service;

  GeoRepositoryImpl({required this.service});

  @override
  Future<DataState<List<GeoSuggestionEntity>>> geoSuggestion(
      String city, String search) async {
    try {
      List<GeoSuggestionDto> geoSuggestions =
          await service.suggestions(GeoSuggestionRequestDto(
        search: search,
        city: city,
      ));

      return DataSuccess([
        ...geoSuggestions.map((suggestion) => GeoSuggestionEntity(
              value: suggestion.value,
              street: suggestion.street,
              streetType: suggestion.streetType,
              house: suggestion.house,
              block: suggestion.block,
              flat: suggestion.flat,
              geoLon: suggestion.geoLon,
              geoLat: suggestion.geoLat,
            ))
      ]);
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<GeoAvailableEntity>> geoAvailable(
    double lat,
    double lon,
  ) async {
    try {
      GeoAvailableDto available =
          await service.available(GeoAvailableRequestDto(
              coords: CoordinatesDto(
        lat: lat,
        lon: lon,
      )));

      return DataSuccess(GeoAvailableEntity(
        status: available.status,
        message: available.message,
        filial: available.filial != null
            ? FilialMapper.toEntity(available.filial!)
            : null,
      ));
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        return DataSuccess(GeoAvailableEntity(
          status: e.response?.data['status'],
          message: e.response?.data['message'],
        ));
      }
      return DataFailed(e);
    }
  }
}
