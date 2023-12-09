import 'package:github_search_app/feature/shared/index.dart';
import 'package:hive/hive.dart';

part 'assigner_box.g.dart';

@HiveType(typeId: 7)
class AssignerBox with HiveObjectMixin implements UserModel {
  @HiveField(0)
  @override
  final String login;

  @HiveField(1)
  @override
  final int id;

  @HiveField(2)
  @override
  final String nodeId;

  @HiveField(3)
  @override
  final String avatarUrl;

  @HiveField(4)
  @override
  final String gravatarId;

  @HiveField(5)
  @override
  final String url;

  @HiveField(6)
  @override
  final String htmlUrl;

  @HiveField(7)
  @override
  final String followersUrl;

  @HiveField(8)
  @override
  final String followingUrl;

  @HiveField(9)
  @override
  final String gistsUrl;

  @HiveField(10)
  @override
  final String starredUrl;

  @HiveField(11)
  @override
  final String subscriptionsUrl;

  @HiveField(12)
  @override
  final String organizationsUrl;

  @HiveField(13)
  @override
  final String reposUrl;

  @HiveField(14)
  @override
  final String eventsUrl;

  @HiveField(15)
  @override
  final String receivedEventsUrl;

  @HiveField(16)
  @override
  final String type;

  @HiveField(17)
  @override
  final bool siteAdmin;

  AssignerBox({
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

  factory AssignerBox.fromModel(UserModel model) => AssignerBox(
        login: model.login,
        id: model.id,
        nodeId: model.nodeId,
        avatarUrl: model.avatarUrl,
        gravatarId: model.gravatarId,
        url: model.url,
        htmlUrl: model.htmlUrl,
        followersUrl: model.followersUrl,
        followingUrl: model.followingUrl,
        gistsUrl: model.gistsUrl,
        starredUrl: model.starredUrl,
        subscriptionsUrl: model.subscriptionsUrl,
        organizationsUrl: model.organizationsUrl,
        reposUrl: model.reposUrl,
        eventsUrl: model.eventsUrl,
        receivedEventsUrl: model.receivedEventsUrl,
        type: model.type,
        siteAdmin: model.siteAdmin,
      );
}
