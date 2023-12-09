import 'package:github_search_app/feature/explore_history/local/box/assigner_box.dart';
import 'package:github_search_app/feature/shared/response/user_item_response.dart';

class UserModel {
  final String login;
  final int id;
  final String nodeId;
  final String avatarUrl;
  final String gravatarId;
  final String url;
  final String htmlUrl;
  final String followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String subscriptionsUrl;
  final String organizationsUrl;
  final String reposUrl;
  final String eventsUrl;
  final String receivedEventsUrl;
  final String type;
  final bool siteAdmin;

  UserModel({
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

  factory UserModel.fromResponse(UserItemResponse response) => UserModel(
        login: response.login,
        id: response.id,
        nodeId: response.nodeId,
        avatarUrl: response.avatarUrl,
        gravatarId: response.gravatarId,
        url: response.url,
        htmlUrl: response.htmlUrl,
        followersUrl: response.followersUrl,
        followingUrl: response.followingUrl,
        gistsUrl: response.gistsUrl,
        starredUrl: response.starredUrl,
        subscriptionsUrl: response.subscriptionsUrl,
        organizationsUrl: response.organizationsUrl,
        reposUrl: response.reposUrl,
        eventsUrl: response.eventsUrl,
        receivedEventsUrl: response.receivedEventsUrl,
        type: response.type,
        siteAdmin: response.siteAdmin,
      );

  factory UserModel.fromBox(AssignerBox box) => UserModel(
        login: box.login,
        id: box.id,
        nodeId: box.nodeId,
        avatarUrl: box.avatarUrl,
        gravatarId: box.gravatarId,
        url: box.url,
        htmlUrl: box.htmlUrl,
        followersUrl: box.followersUrl,
        followingUrl: box.followingUrl,
        gistsUrl: box.gistsUrl,
        starredUrl: box.starredUrl,
        subscriptionsUrl: box.subscriptionsUrl,
        organizationsUrl: box.organizationsUrl,
        reposUrl: box.reposUrl,
        eventsUrl: box.eventsUrl,
        receivedEventsUrl: box.receivedEventsUrl,
        type: box.type,
        siteAdmin: box.siteAdmin,
      );
}
