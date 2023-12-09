import 'package:dio/dio.dart';
import 'package:dio/io.dart';

///
/// 아래와 같은 [Dio] 초기설정 모듈
/// 1) header
/// 2) base url
/// 3) 인터셉터
/// 4) http clinet adpater
///

class AppDio with DioMixin implements Dio {
  AppDio._() {
    const String baseUrl = 'https://api.github.com';
    options = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'application/json',
      connectTimeout: const Duration(milliseconds: 30000),
      sendTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
    );
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Accept'] = 'application/vnd.github+json';
          options.headers['X-GitHub-Api-Version'] = '2022-11-28';
          options.headers['User-Agent'] = 'request';

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          return handler.next(e);
        },
      ),
    ]);
    httpClientAdapter = IOHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}
