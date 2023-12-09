part of 'search_event.dart';

abstract class _SearchEvent {
  ///
  /// 앱바 '취소' 버튼이 클릭 되었을 때
  ///
  void onCancelBtnTapped(BuildContext context);

  ///
  /// [TextField]에 검색어가 입력 되었을 때
  ///
  void onInputChanged(BuildContext context, {required String input});

  ///
  /// 검색 카테고리 옵션 클릭되었을 때
  ///
  void onSearchOptionTapped(
    BuildContext context, {
    required GithubElementCategory selectedCategory,
    required String keyword,
  });
}
