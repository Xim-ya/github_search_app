import 'package:dio/dio.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

@RestApi()
abstract interface class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  /// 검색된 유저 결과 리스트
  @GET('/search/users')
  Future<UserSearchResponse> loadSearchedUsers(@Query('q') String query,
      @Query('per_page') int perPage, @Query('page') int page);

  /// 유저 상세 정보 호출
  @GET('/users/{userLoginName}')
  Future<UserDetailResponse> loadUserDetailInfo(
    @Path('userLoginName') String userLoginName,
  );
}
