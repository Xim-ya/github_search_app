import 'package:github_search_app/feature/shared/response/user_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_detail_response.g.dart';

@JsonSerializable()
class UserDetailResponse extends UserItemResponse {
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'company')
  String? company;

  @JsonKey(name: 'blog')
  String? blog;

  @JsonKey(name: 'location')
  String? location;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'hireable')
  bool? hireable;

  @JsonKey(name: 'bio')
  String? bio;

  @JsonKey(name: 'twitter_username')
  String? twitterUsername;

  @JsonKey(name: 'public_repos')
  int publicRepos;

  @JsonKey(name: 'public_gists')
  int? publicGists;

  @JsonKey(name: 'followers')
  int followers;

  @JsonKey(name: 'following')
  int following;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  UserDetailResponse({
    required super.login,
    required super.id,
    required super.nodeId,
    required super.avatarUrl,
    required super.gravatarId,
    required super.url,
    required super.htmlUrl,
    required super.followersUrl,
    required super.followingUrl,
    required super.gistsUrl,
    required super.starredUrl,
    required super.subscriptionsUrl,
    required super.organizationsUrl,
    required super.reposUrl,
    required super.eventsUrl,
    required super.receivedEventsUrl,
    required super.type,
    required super.siteAdmin,
    required this.name,
    required this.company,
    required this.blog,
    required this.location,
    required this.email,
    required this.hireable,
    required this.bio,
    required this.twitterUsername,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailResponseFromJson(json);
}
