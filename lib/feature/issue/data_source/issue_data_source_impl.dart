import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/issue/api/response/searched_issue_response.dart';
import 'package:github_search_app/feature/issue/index.dart';

final class IssueDataSourceImpl
    with ApiErrorHandlerMixin
    implements IssueDataSource {
  IssueDataSourceImpl(this._api);

  final IssueApi _api;

  @override
  Future<SearchedIssueResponse> loadSearchedIssues(
          {required String query, required int perPage, required int page}) =>
      loadResponseOrThrow(
        () => _api.loadSearchedIssues('is:issue $query', perPage, page),
      );
}
