import 'package:github_search_app/app/constant/enum/issue_state.enum.dart';
import 'package:github_search_app/feature/explore_history/local/box/assigner_box.dart';
import 'package:github_search_app/feature/explore_history/local/box/label_box.dart';
import 'package:github_search_app/feature/issue/index.dart';
import 'package:github_search_app/feature/shared/index.dart';
import 'package:github_search_app/feature/shared/models/github_element_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'issue_box.g.dart';

@HiveType(typeId: 3)
class IssueBox with HiveObjectMixin implements GithubElementModel {
  @HiveField(0)
  final String title; // 이슈 제목

  @HiveField(1)
  final String createdAt; // 생성 날짜

  @HiveField(2)
  final String repoOwnerLoginName; // 레포 소유자 이름

  @HiveField(3)
  final String repoTitle; // 레포 제목

  @HiveField(4)
  final List<LabelBox> labels; // 라벨 리스트

  @HiveField(5)
  final int commentCount; // 댓글 개수

  @HiveField(6)
  final List<AssignerBox> assigneesBox; // 이슈에 할당된 참여자

  @HiveField(7)
  final String suggesterLoginName; // 이슈 제안자 이름

  @HiveField(8)
  final String suggesterProfileImg; // 이슈 제안자 프로필 이미지

  @HiveField(9)
  final String? issueContent; // 이슈 내용 (MD)

  @HiveField(10)
  final String issueStateTag; // 현재 이슈 상태

  @override
  @HiveField(11)
  final DateTime exploreDate; // 탐색 날짜

  @override
  @HiveField(12)
  final String categoryTag; // 탐색 날짜

  @HiveField(13)
  final String nodeId;

  IssueBox({
    required this.title,
    required this.createdAt,
    required this.repoOwnerLoginName,
    required this.repoTitle,
    required this.labels,
    required this.commentCount,
    required this.assigneesBox,
    required this.suggesterLoginName,
    required this.suggesterProfileImg,
    required this.issueContent,
    required this.issueStateTag,
    required this.exploreDate,
    required this.categoryTag,
    required this.nodeId,
  });

  static IssueBasicInfoModel toModel(IssueBox box) => IssueBasicInfoModel(
        nodeId: box.nodeId,
        title: box.title,
        createdAt: box.createdAt,
        repoOwnerLoginName: box.repoOwnerLoginName,
        repoTitle: box.repoTitle,
        labels: box.labels.map((e) => LabelModel.fromBox(e)).toList(),
        commentCount: box.commentCount,
        assignees: box.assigneesBox.map((e) => UserModel.fromBox(e)).toList(),
        suggesterLoginName: box.suggesterLoginName,
        suggesterProfileImg: box.suggesterProfileImg,
        issueContent: box.issueContent,
        state: IssueState.getStateByTag(box.issueStateTag),
      );
}
