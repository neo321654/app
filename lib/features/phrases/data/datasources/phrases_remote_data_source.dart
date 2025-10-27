import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:monobox/features/phrases/data/models/phrase_model.dart';

part 'phrases_remote_data_source.g.dart';

@RestApi(baseUrl: "https://admin.monobox.app/api/v1")
abstract class PhrasesRemoteDataSource {
  factory PhrasesRemoteDataSource(Dio dio, {String baseUrl}) = _PhrasesRemoteDataSource;

  @GET("/phrases/1")
  Future<HttpResponse<List<PhraseModel>>> getPhrases();
}
