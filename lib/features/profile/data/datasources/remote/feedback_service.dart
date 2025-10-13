import 'package:dio/dio.dart';

class FeedbackService {
  FeedbackService(this.dio);

  final Dio dio;

  Future<void> addReview(
    int orderId,
    int rate1,
    int rate2,
    int rate3,
    String content,
    List<MultipartFile>? images,
  ) async {
    final FormData formData = FormData.fromMap(<String, dynamic>{
      'rate1': rate1,
      'rate2': rate2,
      'rate3': rate3,
      'content': content,
    });

    if (images != null) {
      images
          .map((image) => formData.files.add(MapEntry('images[]', image)))
          .toList();
    }

    final dynamic response = await dio.post<dynamic>(
      '/reviews/$orderId',
      data: formData,
    );

    print(response);
  }
}
