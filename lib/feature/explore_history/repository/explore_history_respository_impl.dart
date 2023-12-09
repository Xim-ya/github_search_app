import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/explore_history/index.dart';
import 'package:github_search_app/feature/shared/index.dart';

final class ExploreHistoryRepositoryImpl implements ExploreHistoryRepository {
  ExploreHistoryRepositoryImpl(this.local);

  final ExploreHistoryDao local;

  @override
  Future<Result<void>> addItemToExploreHistory(
      {required item, required GithubElementCategory category}) async {
    try {
      final response =
          await local.addItemToExploreHistory(item: item, category: category);
      if (local.getTotalElementCount() > 10) {
        await local.deleteLastItemInCategory(category.tag);
      }
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Result<List<GithubElementModel>> getExploreHistories() {
    try {
      final response = local.getExploreHistories();

      List<GithubElementModel> allElements = [];
      allElements.addAll(response.userList);
      allElements.addAll(response.repoList);
      allElements.addAll(response.issueList);
      allElements.addAll(response.prList);

      allElements.sort((a, b) {
        DateTime dateA = a.exploreDate;
        DateTime dateB = b.exploreDate;
        return dateB.compareTo(dateA);
      });

      return Result.success(allElements);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
