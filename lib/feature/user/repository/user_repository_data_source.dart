import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:github_search_app/feature/user/index.dart';

final class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._dataSource);

  final UserDataSource _dataSource;

  @override
  Future<Result<List<UserBasicInfoModel>>> loadSearchedUserList(
      {required String query, required int perPage, required int page}) async {
    try {
      final response = await _dataSource.loadSearchedUsers(
          query: query, perPage: perPage, page: page);

      final result = response.items
          .map((e) => UserBasicInfoModel.fromResponse(e))
          .toList();

      return Result.success(result);
    } on TypeError catch (e) {
      return Result.failure(DomainException.formFormatException(e));
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<SearchedUserCollectionModel>> loadSearchedUserCollection(
      {required String query, required int perPage, required int page}) async {
    try {
      final response = await _dataSource.loadSearchedUsers(
          query: query, perPage: perPage, page: page);
      final result = SearchedUserCollectionModel.fromResponse(response);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<UserDetailInfoModel>> loadUserDetailInfo(
      String userLoginName) async {
    try {
      final response = await _dataSource.loadUserDetailInfo(userLoginName);
      final result = UserDetailInfoModel.fromResponse(response);

      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Result<List<UserBox>> getListOfUsers() {
    try {
      final response = _dataSource.getListOfUsers();
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<void>> addFavoriteUser(UserBox user) async {
    try {
      final response = _dataSource.addFavoriteUser(user);
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Result<bool> isUserInFavorites(String loginName) {
    try {
      final response = _dataSource.isUserInFavorites(loginName);
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<void>> deleteUserFromFavorites(String loginName) async {
    try {
      final response = _dataSource.deleteUserFromFavorites(loginName);
      return Result.success(response);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
