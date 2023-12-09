import 'package:dio/dio.dart';
import 'package:github_search_app/feature/issue/api/response/searched_issue_response.dart';
import 'package:retrofit/retrofit.dart';

part 'issue_api.g.dart';

@RestApi()
abstract interface class IssueApi {
  factory IssueApi(Dio dio, {String baseUrl}) = _IssueApi;

  /// 검색된 이슈 리스트 호출
  @GET('/search/issues')
  Future<SearchedIssueResponse> loadSearchedIssues(
    @Query('q') String query,
    @Query('per_page') int perPage,
    @Query('page') int page,
  );
}
