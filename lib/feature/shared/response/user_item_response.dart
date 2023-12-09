import 'package:json_annotation/json_annotation.dart';

part 'user_item_response.g.dart';

@JsonSerializable()
class UserItemResponse {
  @JsonKey(name: 'login')
  String login;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'node_id')
  String nodeId;

  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  @JsonKey(name: 'gravatar_id')
  String gravatarId;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'html_url')
  String htmlUrl;

  @JsonKey(name: 'followers_url')
  String followersUrl;

  @JsonKey(name: 'following_url')
  String followingUrl;

  @JsonKey(name: 'gists_url')
  String gistsUrl;

  @JsonKey(name: 'starred_url')
  String starredUrl;

  @JsonKey(name: 'subscriptions_url')
  String subscriptionsUrl;

  @JsonKey(name: 'organizations_url')
  String organizationsUrl;

  @JsonKey(name: 'repos_url')
  String reposUrl;

  @JsonKey(name: 'events_url')
  String eventsUrl;

  @JsonKey(name: 'received_events_url')
  String receivedEventsUrl;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'site_admin')
  bool siteAdmin;

  UserItemResponse({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory UserItemResponse.fromJson(Map<String, dynamic> json) =>
      _$UserItemResponseFromJson(json);
}
