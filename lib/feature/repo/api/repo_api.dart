import 'package:dio/dio.dart';
import 'package:github_search_app/feature/repo/index.dart';
import 'package:retrofit/retrofit.dart';

part 'repo_api.g.dart';

@RestApi()
abstract interface class RepoApi {
  factory RepoApi(Dio dio, {String baseUrl}) = _RepoApi;

  /// 검색된 레포지터리 리스트 호출
  @GET('/search/repositories')
  Future<SearchedRepoResponse> loadSearchedRepositories(
    @Query('q') String query,
    @Query('per_page') int perPage,
    @Query('page') int page,
  );

  /// 레포지토리 리드미 정보 호출
  @GET('/repos/{userLoginName}/{repoTitle}/contents/README.md')
  Future<RepoReadMeResponse> loadRepoReadMe({
    @Path('userLoginName') required String userLoginName,
    @Path('repoTitle') required String repoTitle,
  });
}
