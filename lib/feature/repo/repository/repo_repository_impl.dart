import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/repo/index.dart';

final class RepoRepositoryImpl implements RepoRepository {
  RepoRepositoryImpl(this._dataSource);

  final RepoDataSource _dataSource;

  @override
  Future<Result<List<RepoBasicInfoModel>>> loadSearchedRepositories(
      {required String query, required int perPage, required int page}) async {
    try {
      final response = await _dataSource.loadSearchedRepositories(
          query: query, perPage: perPage, page: page);

      final result = response.items
          .map((e) => RepoBasicInfoModel.fromResponse(e))
          .toList();

      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<SearchedRepoCollectionModel>> loadSearchedRepositoryCollection(
      {required String query, required int perPage, required int page}) async {
    try {
      final response = await _dataSource.loadSearchedRepositories(
          query: query, perPage: perPage, page: page);
      final result = SearchedRepoCollectionModel.fromResponse(response);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<String>> loadReadMeContent(
      {required String userLoginName, required String repoTitle}) async {
    try {
      final response = await _dataSource.loadRepoReadMe(
          userLoginName: userLoginName, repoTitle: repoTitle);

      return Result.success(response.content);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
