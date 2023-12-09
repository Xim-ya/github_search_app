import 'package:github_search_app/feature/issue/api/response/searched_issue_response.dart';

abstract interface class IssueDataSource {
  /// 검색된 이슈 리스트 호출
  Future<SearchedIssueResponse> loadSearchedIssues({
    required String query,
    required int perPage,
    required int page,
  });
}
