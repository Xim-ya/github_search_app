import 'package:dio/dio.dart';
import 'package:github_search_app/app/modules/index.dart';

///
/// 네트워크 Exception
/// [ApiErrorHandlerMixin] 모듈에서 매핑됨.
///

class NetworkException extends BaseException {
  final String name;
  final String? code;
  final int? statusCode;
  final NetworkExceptionType exceptionType;

  // flutter: {"message":"This repository is empty.","documentation_url":"https://docs.github.com/v3/repos/contents/#get-contents"}
  NetworkException({
    this.code,
    int? statusCode,
    this.exceptionType = NetworkExceptionType.badResponse,
    required super.message,
  })  : statusCode = statusCode ?? 500,
        name = exceptionType.name;

  factory NetworkException.fromDioException(DioException error) {
    final statusCode = error.response?.statusCode;
    final String? messageResponse = error.response?.data['message'];

    switch (statusCode) {
      case 403
          when messageResponse != null &&
                  messageResponse.contains('API rate limit') ||
              messageResponse!.contains('secondary rate limit'):
        {
          const exception = NetworkExceptionType.apiLimited;
          return NetworkException(
            exceptionType: exception,
            statusCode: error.response?.statusCode,
            message: exception.description,
          );
        }

      case 404
          when messageResponse != null && messageResponse.contains('Not Found'):
        const exception = NetworkExceptionType.noResultFount;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );

      case 404
          when messageResponse != null &&
              messageResponse.contains('This repository is empty'):
        const exception = NetworkExceptionType.noResultFount;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: '존재하지 않은 레포지토리입니다.',
        );

      case 403:
        const exception = NetworkExceptionType.forbidden;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );

      case 304:
        const exception = NetworkExceptionType.notModified;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );

      case 422:
        const exception = NetworkExceptionType.notModified;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );

      case 503:
        const exception = NetworkExceptionType.notModified;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );
    }

    switch (error.type) {
      case DioExceptionType.cancel:
        const exception = NetworkExceptionType.cancel;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );
      case DioExceptionType.connectionTimeout:
        const exception = NetworkExceptionType.connectionTimeout;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );
      case DioExceptionType.sendTimeout:
        const exception = NetworkExceptionType.sendTimeout;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );
      case DioExceptionType.receiveTimeout:
        const exception = NetworkExceptionType.receiveTimeout;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );

      case DioExceptionType.badCertificate:
        const exception = NetworkExceptionType.badResponse;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );

      case DioExceptionType.connectionError:
        const exception = NetworkExceptionType.connectionError;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );

      case DioExceptionType.badResponse:
        const exception = NetworkExceptionType.badResponse;
        return NetworkException(
          exceptionType: NetworkExceptionType.badResponse,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );

      case DioExceptionType.unknown:
        const exception = NetworkExceptionType.unknown;
        return NetworkException(
          exceptionType: exception,
          statusCode: error.response?.statusCode,
          message: exception.description,
        );
    }
  }
}
