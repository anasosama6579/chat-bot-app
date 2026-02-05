import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api_constants.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 60);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }


  static void addDioInterceptor() {
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers[ApiConstants.key] = ApiConstants.apiKey;
          options.headers['Content-Type'] = 'application/json';
          return handler.next(options);
        },
      ),
    );

    // Your existing logger
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
