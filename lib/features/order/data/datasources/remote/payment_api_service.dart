import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../models/payment_methods_dto.dart';

part 'payment_api_service.g.dart';

@RestApi()
abstract class PaymentApiService {
  factory PaymentApiService(Dio dio) = _PaymentApiService;

  @GET('/paymentmethods')
  Future<PaymentMethodsDto> getPaymentMethods(
      {@Query('delivery_id') int? deliveryId});
}
