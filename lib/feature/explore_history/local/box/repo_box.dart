import 'package:github_search_app/feature/repo/index.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'repo_box.g.dart';

@HiveType(typeId: 2)
class RepoBox with HiveObjectMixin implements RepoBasicInfoModel {
  @override
  @HiveField(0)
  final String nodeId; // 아이디

  @override
  @HiveField(1)
  final String userLoginName; // 레포 소유자 이름

  @override
  @HiveField(2)
  final String userProfileImgUrl; // 레포 소유자 프로필 이미지,

  @override
  @HiveField(3)
  final String title; // 레포 제목

  @override
  @HiveField(4)
  final String? description; // 레포 설명

  @override
  @HiveField(5)
  final String? language; // 프로그래밍 언어

  @override
  @HiveField(6)
  final int starCount; // 스타 개수

  @override
  @HiveField(7)
  final int forkCount; // 포크 개수

  @override
  @HiveField(8)
  final DateTime exploreDate; // 탐색 날짜

  @override
  @HiveField(9)
  final String categoryTag;

  RepoBox({
    required this.nodeId,
    required this.userLoginName,
    required this.userProfileImgUrl,
    required this.title,
    required this.description,
    required this.language,
    required this.starCount,
    required this.forkCount,
    required this.exploreDate,
    required this.categoryTag,
  });

  static RepoBasicInfoModel toModel(RepoBox box) => RepoBasicInfoModel(
        nodeId: box.nodeId,
        userLoginName: box.userLoginName,
        userProfileImgUrl: box.userProfileImgUrl,
        title: box.title,
        description: box.description,
        language: box.language,
        starCount: box.starCount,
        forkCount: box.forkCount,
      );
}
