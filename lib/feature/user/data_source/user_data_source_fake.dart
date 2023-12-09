import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:github_search_app/feature/user/api/response/user_detail_response.dart';
import 'package:github_search_app/feature/user/api/response/user_search_response.dart';
import 'package:github_search_app/feature/user/data_source/user_data_source.dart';

final class UserDataSourceFake implements UserDataSource {
  @override
  Future<void> addFavoriteUser(UserBox user) {
    // TODO: implement addFavoriteUser
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUserFromFavorites(String loginName) {
    // TODO: implement deleteUserFromFavorites
    throw UnimplementedError();
  }

  @override
  List<UserBox> getListOfUsers() {
    // TODO: implement getListOfUsers
    throw UnimplementedError();
  }

  @override
  bool isUserInFavorites(String loginName) {
    // TODO: implement isUserInFavorites
    throw UnimplementedError();
  }

  @override
  Future<UserSearchResponse> loadSearchedUsers(
      {required String query, required int perPage, required int page}) {
    // TODO: implement loadSearchedUsers
    throw UnimplementedError();
  }

  @override
  Future<UserDetailResponse> loadUserDetailInfo(String userLoginName) {
    // TODO: implement loadUserDetailInfo
    throw UnimplementedError();
  }
}
