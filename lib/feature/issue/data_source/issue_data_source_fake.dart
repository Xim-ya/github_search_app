import 'package:github_search_app/feature/issue/api/response/searched_issue_response.dart';
import 'package:github_search_app/feature/issue/data_source/issue_data_source.dart';

final class IssueDataSourceFake implements IssueDataSource {
  @override
  Future<SearchedIssueResponse> loadSearchedIssues(
      {required String query, required int perPage, required int page}) {
    // TODO: implement loadSearchedIssues
    throw UnimplementedError();
  }
}
