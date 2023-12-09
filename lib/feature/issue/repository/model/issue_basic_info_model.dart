import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/helper/index.dart';
import 'package:github_search_app/feature/explore_history/local/box/assigner_box.dart';
import 'package:github_search_app/feature/explore_history/local/box/issue_box.dart';
import 'package:github_search_app/feature/explore_history/local/box/label_box.dart';
import 'package:github_search_app/feature/issue/index.dart';
import 'package:github_search_app/feature/shared/index.dart';
import 'package:github_search_app/feature/shared/models/github_element_model.dart';

class IssueBasicInfoModel extends GithubElementModel {
  final String title; // 이슈 제목
  final String createdAt; // 생성 날짜
  final String repoOwnerLoginName; // 레포 소유자 이름
  final String repoTitle; // 레포 제목
  final List<LabelModel> labels; // 라벨 리스트
  final int commentCount; // 댓글 개수
  final List<UserModel> assignees; // 이슈에 할당된 참여자
  final String suggesterLoginName; // 이슈 제안자 이름
  final String suggesterProfileImg; // 이슈 제안자 프로필 이미지
  final String? issueContent; // 이슈 내용 (MD)
  final IssueState state; // 현재 이슈 상태

  IssueBasicInfoModel({
    required this.title,
    required this.createdAt,
    required this.repoOwnerLoginName,
    required this.repoTitle,
    required this.labels,
    required this.commentCount,
    required this.assignees,
    required this.suggesterLoginName,
    required this.suggesterProfileImg,
    required this.issueContent,
    required this.state,
    required String nodeId,
  }) : super(DateTime.now(), GithubElementCategory.issue.tag, nodeId);

  factory IssueBasicInfoModel.fromResponse(IssueItemResponse response) {
    final parsedUrl = AppRegex.parseGitHubIssueUrl(response.url);

    return IssueBasicInfoModel(
      nodeId: response.nodeId,
      title: response.title,
      createdAt: response.createdAt,
      repoOwnerLoginName: parsedUrl?[0] ?? '이름 없음',
      repoTitle: parsedUrl?[1] ?? '리포지토리 제목 없음',
      labels: response.labels.map((e) => LabelModel.fromResponse(e)).toList(),
      commentCount: response.comments,
      assignees:
          response.assignees.map((e) => UserModel.fromResponse(e)).toList(),
      suggesterLoginName: response.user.login,
      suggesterProfileImg: response.user.avatarUrl,
      issueContent: response.body,
      state: response.state == 'open' ? IssueState.open : IssueState.closed,
    );
  }

  static IssueBox toBox(IssueBasicInfoModel model) => IssueBox(
      nodeId: model.nodeId,
      title: model.title,
      createdAt: model.createdAt,
      repoOwnerLoginName: model.repoOwnerLoginName,
      repoTitle: model.repoTitle,
      labels: model.labels.map((e) => LabelBox.fromModel(e)).toList(),
      commentCount: model.commentCount,
      assigneesBox:
          model.assignees.map((e) => AssignerBox.fromModel(e)).toList(),
      suggesterLoginName: model.suggesterLoginName,
      suggesterProfileImg: model.suggesterProfileImg,
      issueContent: model.issueContent,
      exploreDate: model.exploreDate,
      categoryTag: GithubElementCategory.issue.tag,
      issueStateTag: model.state.tag);
}
