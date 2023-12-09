import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/issue/index.dart';

abstract interface class IssueRepository {
  /// 검색된 이슈 리스트 호출
  Future<Result<List<IssueBasicInfoModel>>> loadSearchedIssues({
    required String query,
    required int perPage,
    required int page,
  });

  /// 검색된 이슈 컬렉션 호출
  Future<Result<SearchedIssueCollectionModel>> loadSearchedIssueCollection({
    required String query,
    required int perPage,
    required int page,
  });
}
