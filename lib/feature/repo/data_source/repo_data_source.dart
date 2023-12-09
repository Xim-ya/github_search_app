import 'package:github_search_app/feature/repo/index.dart';

abstract interface class RepoDataSource {
  /// 검색된 레포지터리 리스트 호출
  Future<SearchedRepoResponse> loadSearchedRepositories({
    required String query,
    required int perPage,
    required int page,
  });

  /// 레포 리드미 호출
  Future<RepoReadMeResponse> loadRepoReadMe(
      {required String userLoginName, required String repoTitle});
}
