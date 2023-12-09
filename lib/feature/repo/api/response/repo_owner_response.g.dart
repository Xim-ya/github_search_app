// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_owner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoOwnerResponse _$RepoOwnerResponseFromJson(Map<String, dynamic> json) =>
    RepoOwnerResponse(
      login: json['login'] as String,
      id: json['id'] as int,
      avatarUrl: json['avatar_url'] as String,
      nodeId: json['node_id'] as String,
      url: json['url'] as String,
      receivedEventsUrl: json['received_events_url'] as String,
      type: json['type'] as String,
      htmlUrl: json['html_url'] as String,
      followersUrl: json['followers_url'] as String,
      followingUrl: json['following_url'] as String,
      gistsUrl: json['gists_url'] as String,
      starredUrl: json['starred_url'] as String,
      subscriptionsUrl: json['subscriptions_url'] as String,
      organizationsUrl: json['organizations_url'] as String,
      reposUrl: json['repos_url'] as String,
      eventsUrl: json['events_url'] as String,
      siteAdmin: json['site_admin'] as bool,
    );

Map<String, dynamic> _$RepoOwnerResponseToJson(RepoOwnerResponse instance) =>
    <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
      'node_id': instance.nodeId,
      'url': instance.url,
      'received_events_url': instance.receivedEventsUrl,
      'type': instance.type,
      'html_url': instance.htmlUrl,
      'followers_url': instance.followersUrl,
      'following_url': instance.followingUrl,
      'gists_url': instance.gistsUrl,
      'starred_url': instance.starredUrl,
      'subscriptions_url': instance.subscriptionsUrl,
      'organizations_url': instance.organizationsUrl,
      'repos_url': instance.reposUrl,
      'events_url': instance.eventsUrl,
      'site_admin': instance.siteAdmin,
    };
