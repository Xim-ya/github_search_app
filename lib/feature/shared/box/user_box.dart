import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_box.g.dart';

@HiveType(typeId: 0)
class UserBox with HiveObjectMixin implements UserBasicInfoModel {
  @override
  @HiveField(0)
  final String nodeId; //유저 아이디

  @override
  @HiveField(1)
  final String loginName; // 유저 로그인 이름;

  @override
  @HiveField(2)
  final String profileImgUrl; // 유저 프로필 이미지;

  @HiveField(3)
  final String? bio; // 소개글

  @HiveField(4)
  final String? location; // 위치

  @HiveField(5)
  final int followersCount; // 팔로워 수

  @HiveField(6)
  final int followingCount; // 팔로잉 수

  @override
  @HiveField(7)
  final DateTime exploreDate; // 탐색 날짜

  @override
  @HiveField(8)
  final String categoryTag; // 카테고리

  UserBox({
    required this.nodeId,
    required this.loginName,
    required this.profileImgUrl,
    required this.bio,
    required this.location,
    required this.followersCount,
    required this.followingCount,
    required this.exploreDate,
    required this.categoryTag,
  });

  factory UserBox.fromModel(UserDetailInfoModel model) => UserBox(
        nodeId: model.nodeId,
        loginName: model.loginName,
        profileImgUrl: model.profileImgUrl,
        bio: model.bio,
        location: model.location,
        followersCount: model.followersCount,
        followingCount: model.followingCount,
        exploreDate: model.exploreDate,
        categoryTag: GithubElementCategory.user.tag,
      );

  static UserBasicInfoModel toModel(UserBox box) => UserBasicInfoModel(
      loginName: box.loginName,
      nodeId: box.nodeId,
      profileImgUrl: box.profileImgUrl);
}
