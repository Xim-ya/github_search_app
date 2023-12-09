import 'package:dio/dio.dart';
import 'package:github_search_app/feature/pr/index.dart';
import 'package:retrofit/retrofit.dart';

part 'pr_api.g.dart';

@RestApi()
abstract interface class PrApi {
  factory PrApi(Dio dio, {String baseUrl}) = _PrApi;

  /// 검색된 PR 리스트 호출
  @GET('/search/issues')
  Future<SearchedPrResponse> loadSearchedPRList(
    @Query('q') String query,
    @Query('per_page') int perPage,
    @Query('page') int page,
  );
}
