import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/shared/models/github_element_model.dart';

abstract interface class ExploreHistoryRepository {
  ///
  /// 탐색 기록에 항목 추가
  ///
  Future<Result<void>> addItemToExploreHistory(
      {required dynamic item, required GithubElementCategory category});

  Result<List<GithubElementModel>> getExploreHistories();
}
