import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/issue/index.dart';

final class IssueRepositoryImpl implements IssueRepository {
  IssueRepositoryImpl(this._dataSource);

  final IssueDataSource _dataSource;

  @override
  Future<Result<List<IssueBasicInfoModel>>> loadSearchedIssues(
      {required String query, required int perPage, required int page}) async {
    try {
      final response = await _dataSource.loadSearchedIssues(
          query: query, perPage: perPage, page: page);

      final result = response.items
          .map((e) => IssueBasicInfoModel.fromResponse(e))
          .toList();

      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<SearchedIssueCollectionModel>> loadSearchedIssueCollection(
      {required String query, required int perPage, required int page}) async {
    try {
      final response = await _dataSource.loadSearchedIssues(
          query: query, perPage: perPage, page: page);
      final result = SearchedIssueCollectionModel.fromResponse(response);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
