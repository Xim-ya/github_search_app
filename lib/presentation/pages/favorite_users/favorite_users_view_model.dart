import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:github_search_app/presentation/base/base_view_model.dart';
import 'package:github_search_app/presentation/pages/home/state/favorite_user_state_notifier.dart';

class FavoriteUsersViewModel extends BaseViewModel {
  FavoriteUsersViewModel(this._favoriteFriendStateNotifier);

  ///
  /// 전달받은 State Notifier
  ///
  final FavoriteFriendStateNotifier _favoriteFriendStateNotifier;

  ///
  /// 즐겨찾는 유저 리스트
  ///
  List<UserBox> favoriteUsers = [];

  ///
  /// 즐겨찾는 유저로부터 삭제
  ///
  Future<void> removeUserFromList(String loginName) async {
    _favoriteFriendStateNotifier.removeUserFromFavorites(loginName);
  }

  ///
  /// 즐겨찾는 유저에 추가
  ///
  Future<void> addUserFromList(UserBox user) async {
    _favoriteFriendStateNotifier.addUserToFavoriteList(user);
  }

  @override
  void onInit() {
    super.onInit();
    favoriteUsers.addAll(_favoriteFriendStateNotifier.favoriteUserList.value);
  }
}
