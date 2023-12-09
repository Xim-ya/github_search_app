import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/repo/index.dart';

final class RepoDataSourceImpl
    with ApiErrorHandlerMixin
    implements RepoDataSource {
  RepoDataSourceImpl(this._api);

  final RepoApi _api;

  @override
  Future<SearchedRepoResponse> loadSearchedRepositories({
    required String query,
    required int perPage,
    required int page,
  }) =>
      loadResponseOrThrow(
          () => _api.loadSearchedRepositories(query, perPage, page));

  @override
  Future<RepoReadMeResponse> loadRepoReadMe(
          {required String userLoginName, required String repoTitle}) =>
      loadResponseOrThrow(
        () => _api.loadRepoReadMe(
            userLoginName: userLoginName, repoTitle: repoTitle),
      );
}
