import 'package:github_search_app/app/constant/index.dart';

///
/// 유저 활동에 대한 통계적인 측정 값
/// 아래 정보를 담고 있음
/// 레포지터리 , 팔로워 , 팔로잉
///
enum UserMetric {
  repository('리포지토리', AppAssets.repoIcon),
  followers('팔로워', AppAssets.followersIcon),
  following('팔로잉', AppAssets.followingIcon);

  final String text;
  final String icon;

  const UserMetric(this.text, this.icon);

  bool get isRepository => this == UserMetric.repository;
  bool get isFollowers => this == UserMetric.followers;
  bool get isFollowing => this == UserMetric.following;
}
