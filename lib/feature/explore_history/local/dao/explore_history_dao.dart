import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/explore_history/index.dart';
import 'package:hive/hive.dart';

class ExploreHistoryDao {
  ExploreHistoryDao(this.box);

  final Box<ExploreHistoryCollectionBox> box;

  ExploreHistoryCollectionBox get value =>
      box.values.firstOrNull ??
      ExploreHistoryCollectionBox(
          userList: [], repoList: [], issueList: [], prList: []);

  ///
  /// 탐색 기록에 항목 추가
  ///
  Future<void> addItemToExploreHistory(
      {required dynamic item, required GithubElementCategory category}) async {
    GithubElementCategory.branch(
        targetCategory: category,
        user: (_) async {
          value.userList.removeWhere((e) => e.nodeId == item.nodeId);
          await box.put(AppLocal.exploreBox,
              value.copyWith(userList: [item, ...value.userList]));
        },
        repository: (_) async {
          value.repoList.removeWhere((e) => e.nodeId == item.nodeId);
          await box.put(AppLocal.exploreBox,
              value.copyWith(repoList: [item, ...value.repoList]));
        },
        issue: (_) async {
          value.issueList.removeWhere((e) => e.nodeId == item.nodeId);
          await box.put(AppLocal.exploreBox,
              value.copyWith(issueList: [item, ...value.issueList]));
        },
        pr: (_) async {
          value.prList.removeWhere((e) => e.nodeId == item.nodeId);
          await box.put(AppLocal.exploreBox,
              value.copyWith(prList: [item, ...value.prList]));
        });
  }

  ///
  /// 탐색 기록 호출
  ///
  ExploreHistoryCollectionBox getExploreHistories() {
    return box.values.firstOrNull ??
        ExploreHistoryCollectionBox(
            userList: [], repoList: [], issueList: [], prList: []);
  }

  ///
  /// 모든 컬렉션 리스트의 총합
  ///
  int getTotalElementCount() {
    return value.userList.length +
        value.repoList.length +
        value.issueList.length +
        value.prList.length;
  }

  ///
  /// 특정 카테고리의 마지막 원소 제거
  ///
  Future<void> deleteLastItemInCategory(String categoryTag) async {
    GithubElementCategory.branch(
        targetCategory: GithubElementCategory.getCategoryByTag(categoryTag),
        user: (_) async {
          final list = value.userList;
          list.removeLast();
          await box.put(AppLocal.exploreBox, value.copyWith(userList: list));
        },
        repository: (_) async {
          final list = value.repoList;
          list.removeLast();
          await box.put(AppLocal.exploreBox, value.copyWith(repoList: list));
        },
        issue: (_) async {
          final list = value.issueList;
          list.removeLast();
          await box.put(AppLocal.exploreBox, value.copyWith(issueList: list));
        },
        pr: (_) async {
          final list = value.prList;
          list.removeLast();
          await box.put(AppLocal.exploreBox, value.copyWith(prList: list));
        });
  }
}
