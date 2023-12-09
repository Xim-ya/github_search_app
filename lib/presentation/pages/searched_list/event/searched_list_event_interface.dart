part of 'searched_list_event.dart';

abstract class _SearchedListEvent {
  ///
  /// 전체 검색 결과 페이지로 이동할 때
  ///
  void routeToTotalSearchedResult(
    BuildContext context, {
    required GithubElementCategory selectedCategory,
    required String keyword,
    required int totalCount,
  });
}
