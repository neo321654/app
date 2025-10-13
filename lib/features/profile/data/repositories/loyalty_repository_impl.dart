import 'package:dio/dio.dart';
import 'package:monobox/core/resources/data_state.dart';
import 'package:monobox/features/profile/data/models/loyalty_entry_request_dto.dart';
import 'package:monobox/features/profile/data/models/loyalty_entry_response_dto.dart';

import 'package:monobox/features/profile/domain/entities/loyalty_entity.dart';
import 'package:monobox/features/profile/domain/entities/loyalty_entry_request_entity.dart';
import 'package:monobox/features/profile/domain/entities/loyalty_entry_response_entity.dart';

import '../../domain/repositories/loyalty_repository.dart';
import '../datasources/remote/loyalty_api_service.dart';
import '../models/loyalty_dto.dart';

class LoyaltyRepositoryImpl implements LoyaltyRepository {
  final LoyaltyApiService service;

  LoyaltyRepositoryImpl({required this.service});

  @override
  Future<DataState<List<LoyaltyEntity>>> loyaltyInfo() async {
    try {
      List<LoyaltyDto> loyalties = await service.loyaltyInfo();

      return DataSuccess(
        [
          ...loyalties.map((loyalty) => LoyaltyEntity(
                title: loyalty.title,
                discount: loyalty.discount,
                sumFrom: loyalty.sumFrom,
                active: loyalty.active,
              ))
        ],
      );
    } on DioException catch (e) {
      return DataFailed(
        DioException(
          requestOptions: e.requestOptions,
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<DataState<LoyaltyEntryResponseEntity>> loyaltyEntry(
      LoyaltyEntryRequestEntity request) async {
    try {
      LoyaltyEntryResponseDto response =
          await service.loyaltyEntry(LoyaltyEntryRequestDto(
        name: request.name,
        email: request.email,
        birthdate: request.birthdate,
      ));

      return DataSuccess(LoyaltyEntryResponseEntity(
          status: response.status, message: response.message));
    } on DioException catch (e) {
      return DataFailed(
        DioException(
          requestOptions: e.requestOptions,
          message: e.message,
        ),
      );
    }
  }
}
