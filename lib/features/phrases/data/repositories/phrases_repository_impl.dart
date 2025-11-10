import 'dart:io';

import 'package:dio/dio.dart';
import 'package:monobox/core/resources/data_state.dart';
import 'package:monobox/features/phrases/data/datasources/phrases_remote_data_source.dart';
import 'package:monobox/features/phrases/domain/entities/phrase.dart';
import 'package:monobox/features/phrases/domain/repositories/phrases_repository.dart';
import 'package:monobox/features/phrases/data/models/phrase_model.dart';

class PhrasesRepositoryImpl implements PhrasesRepository {
  final PhrasesRemoteDataSource _phrasesRemoteDataSource;

  PhrasesRepositoryImpl(this._phrasesRemoteDataSource);

  @override
  Future<DataState<List<Phrase>>> getPhrases() async {
    try {
      final httpResponse = await _phrasesRemoteDataSource.getPhrases();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(
          httpResponse.data.map((e) => Phrase(id: e.id, title: e.title, content: e.content)).toList(),
        );
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
