part of 'home_event.dart';

abstract class _HomeEvent {
  /// 상세페이지(유저)로 이동
  void routeToUserDetail(BuildContext context, String userLoginName);

  /// 즐겨찾기 유저 리스트 페이지로 이동
  void routeToFavoriteUsers(BuildContext context);

  /// 상세페이지로 이동
  void routeToSearch(BuildContext context);
}
