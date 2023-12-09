import 'package:dio/dio.dart';
import 'package:github_search_app/app/modules/exception/network/network_exception.dart';

///
/// [DataSource] 레이어에서 네트워크 오류 여부를 확인하고,
/// 네트워크 오류일 경우 [NetworkException]으로 매핑.
///

mixin ApiErrorHandlerMixin {
  Future<T> loadResponseOrThrow<T>(Future<T> Function() actionApi) async {
    try {
      return await actionApi.call();
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
