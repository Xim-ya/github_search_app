import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:github_search_app/feature/user/index.dart';

final class UserDataSourceImpl
    with ApiErrorHandlerMixin
    implements UserDataSource {
  UserDataSourceImpl(this._api, this._local);

  final UserApi _api;
  final UserDao _local;

  @override
  Future<UserSearchResponse> loadSearchedUsers(
          {required String query, required int perPage, required int page}) =>
      loadResponseOrThrow(() => _api.loadSearchedUsers(query, perPage, page));

  @override
  Future<UserDetailResponse> loadUserDetailInfo(String userLoginName) =>
      _api.loadUserDetailInfo(userLoginName);

  @override
  List<UserBox> getListOfUsers() {
    return _local.userList ?? [];
  }

  @override
  Future<void> addFavoriteUser(UserBox user) => _local.addFavoriteUser(user);

  @override
  bool isUserInFavorites(String loginName) =>
      _local.isUserInFavorites(loginName);

  @override
  Future<void> deleteUserFromFavorites(String loginName) =>
      _local.deleteUserFromFavorites(loginName);
}
