import 'package:monobox/features/home/data/models/filials_search_request_dto.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../models/city_dto.dart';
import '../../models/filial_dto.dart';
part 'filials_api_service.g.dart';

@RestApi()
abstract class FilialsApiService {
  factory FilialsApiService(Dio dio) = _FilialsApiService;

  @GET('/filials/cities')
  Future<List<CityDto>> getCities();

  @GET('/filials')
  Future<List<FilialDto>> getFilials();

  @POST('/filials/search')
  Future<List<FilialDto>> searchFilials(
      @Body() FilialsSearchRequestDto request);
}
