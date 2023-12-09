import 'package:github_search_app/app/helper/index.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/shared/index.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:hive/hive.dart';

class UserDao {
  UserDao(this.box);

  final Box<UserListBox> box;

  List<UserBox>? get userList => box.values.firstOrNull?.users;

  ///
  /// 즐겨 찾는 친구에 유저 추가
  ///
  Future<void> addFavoriteUser(UserBox user) async {
    final users = userList ?? [];
    final updatedList = [user, ...users];

    await box.put(
      AppLocal.userBox,
      UserListBox(updatedList),
    );
  }

  ///
  ///  즐겨찾기 유저에 포함되어 있는지 확인
  ///
  bool isUserInFavorites(String loginName) {
    final users = userList ?? [];

    final user = users.firstWhereOrNull((user) => user.loginName == loginName);

    return user != null ? true : false;
  }

  ///
  /// 즐겨찾기 포함된 유저 삭제
  ///
  Future<void> deleteUserFromFavorites(String loginName) async {
    final users = userList ?? [];
    users.removeWhere((user) => user.loginName == loginName);

    await box.put(
      AppLocal.userBox,
      UserListBox(users),
    );
  }
}
