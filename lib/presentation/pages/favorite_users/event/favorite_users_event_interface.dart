part of 'favorite_users_event.dart';

abstract class _FavoriteUsersEvent {
  ///
  /// 즐겨찾기 버튼이 클릭 되었을 때
  ///
  Future<void> onFavoriteBtnTapped(BuildContext context,
      {required bool isFilled, required UserBox user});
}
