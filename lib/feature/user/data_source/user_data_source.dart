import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:github_search_app/feature/user/index.dart';

abstract interface class UserDataSource {
  /// 검색된 유저 결과 리스트 호출
  Future<UserSearchResponse> loadSearchedUsers({
    required String query,
    required int perPage,
    required int page,
  });

  /// 유저 상세 정보 호출
  Future<UserDetailResponse> loadUserDetailInfo(String userLoginName);

  /// 로컬에 저장된 유저 리스트 호출
  List<UserBox> getListOfUsers();

  /// 즐겨찾는 유저 항목 추가
  Future<void> addFavoriteUser(UserBox user);

  /// 즐겨찾기 유저에 포함되어 있는지 확인
  bool isUserInFavorites(String loginName);

  /// 즐겨찾기 포함된 유저 삭제
  Future<void> deleteUserFromFavorites(String loginName);
}
