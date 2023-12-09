import 'package:json_annotation/json_annotation.dart';

part 'repo_owner_response.g.dart';

@JsonSerializable()
class RepoOwnerResponse {
  @JsonKey(name: 'login')
  final String login;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @JsonKey(name: 'node_id')
  final String nodeId;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'received_events_url')
  final String receivedEventsUrl;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @JsonKey(name: 'followers_url')
  final String followersUrl;
  @JsonKey(name: 'following_url')
  final String followingUrl;
  @JsonKey(name: 'gists_url')
  final String gistsUrl;
  @JsonKey(name: 'starred_url')
  final String starredUrl;
  @JsonKey(name: 'subscriptions_url')
  final String subscriptionsUrl;
  @JsonKey(name: 'organizations_url')
  final String organizationsUrl;
  @JsonKey(name: 'repos_url')
  final String reposUrl;
  @JsonKey(name: 'events_url')
  final String eventsUrl;
  @JsonKey(name: 'site_admin')
  final bool siteAdmin;

  RepoOwnerResponse({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.nodeId,
    required this.url,
    required this.receivedEventsUrl,
    required this.type,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.siteAdmin,
  });

  factory RepoOwnerResponse.fromJson(Map<String, dynamic> json) =>
      _$RepoOwnerResponseFromJson(json);
}
