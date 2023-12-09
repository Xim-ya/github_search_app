import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:github_search_app/feature/user/index.dart';

abstract interface class UserRepository {
  /// 검색된 유저 결과 리스트 호출
  Future<Result<List<UserBasicInfoModel>>> loadSearchedUserList({
    required String query,
    required int perPage,
    required int page,
  });

  /// 검색된 유저 컬렉션 결과 호출
  Future<Result<SearchedUserCollectionModel>> loadSearchedUserCollection({
    required String query,
    required int perPage,
    required int page,
  });

  /// 유저 상세 정보 호출
  Future<Result<UserDetailInfoModel>> loadUserDetailInfo(String userLoginName);

  /// 로컬에 저장된 유저 리스트 호출
  Result<List<UserBox>> getListOfUsers();

  /// 즐겨찾는 유저 항목 추가
  Future<Result<void>> addFavoriteUser(UserBox user);

  ///  즐겨찾기 유저에 포함되어 있는지 확인
  Result<bool> isUserInFavorites(String loginName);

  /// 즐겨찾기 포함된 유저 삭제
  Future<Result<void>> deleteUserFromFavorites(String loginName);
}
