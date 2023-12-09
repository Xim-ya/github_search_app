import 'package:github_search_app/feature/repo/index.dart';

final class RepoDataSourceFake implements RepoDataSource {
  @override
  Future<RepoReadMeResponse> loadRepoReadMe(
      {required String userLoginName, required String repoTitle}) {
    // TODO: implement loadRepoReadMe
    throw UnimplementedError();
  }

  @override
  Future<SearchedRepoResponse> loadSearchedRepositories(
      {required String query, required int perPage, required int page}) {
    // TODO: implement loadSearchedRepositories
    throw UnimplementedError();
  }
}
