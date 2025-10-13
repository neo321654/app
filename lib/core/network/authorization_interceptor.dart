import 'package:dio/dio.dart';

import '../resources/store.dart';

class AuthorizationInterceptor extends Interceptor {
  final Store store;

  AuthorizationInterceptor({
    required this.store,
  });
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = store.getToken();
    if (token?.isNotEmpty == true) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['X-Source'] = 'Mobile';
    //options.headers['Authorization'] = 'Bearer bullram_token';
    // options.headers['X-Company'] =
    //     'cJT7s3JST1ZZiys9hvb5K!H0MLvf=7Karaj5mREFuwSz2?4qavpPh0SzSGkAM/pDvU45cbuzGZJGwXSm7SpA7XCMmlLbsgXLv4/c9qZ4ktPx5ge1jQqRlcCOwIStz8eOxUPObVvkWoFC76bp-7-Xkf';
    options.headers['X-Company'] =
        'vwB1upps8YgnUtjZRTVbWLCegEhnRHgAEGhCAGIRA8PC8X0AURyMkM8jxu7V';
    //options.headers['X-Company'] = 'Fw30rfZhjp4NCzfijq2DLGWodTN49g3VjXFQn61rVPp9RmUfrjd4kKr7PXFp';
    return handler.next(options);
  }
}
