import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:github_search_app/feature/user/index.dart';

class UserDetailInfoModel extends UserBasicInfoModel {
  final String? bio; // 소개글
  final String url; // html url
  final int repoCount; // 레포 개수
  final int followersCount; // 팔로워 수
  final int followingCount; // 팔로잉 수
  final String createdAt; // 가입일
  final String? name; // 이름
  final String? location; // 위치

  UserDetailInfoModel({
    required this.bio,
    required this.url,
    required this.repoCount,
    required this.followersCount,
    required this.followingCount,
    required this.createdAt,
    required this.name,
    required this.location,
    required super.loginName,
    required super.profileImgUrl,
    required super.nodeId,
  });

  factory UserDetailInfoModel.fromResponse(UserDetailResponse response) =>
      UserDetailInfoModel(
        bio: response.bio == '' ? null : response.bio,
        url: response.url,
        repoCount: response.publicRepos,
        followersCount: response.followers,
        followingCount: response.following,
        createdAt: response.createdAt,
        name: response.name,
        location: response.location,
        loginName: response.login,
        profileImgUrl: response.avatarUrl,
        nodeId: response.nodeId,
      );

  static UserBox toBox(UserDetailInfoModel model) {
    return UserBox(
      loginName: model.loginName,
      profileImgUrl: model.profileImgUrl,
      bio: model.bio,
      location: model.location,
      followersCount: model.followersCount,
      followingCount: model.followingCount,
      exploreDate: model.exploreDate,
      categoryTag: GithubElementCategory.user.tag,
      nodeId: model.nodeId,
    );
  }
}
