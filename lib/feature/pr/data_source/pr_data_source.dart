import 'package:github_search_app/feature/pr/index.dart';

abstract interface class PrDataSource {
  /// 검색된 PR 리스트 호출
  Future<SearchedPrResponse> loadSearchedIssues({
    required String query,
    required int perPage,
    required int page,
  });
}
