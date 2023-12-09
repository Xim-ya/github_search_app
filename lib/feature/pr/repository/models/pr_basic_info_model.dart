import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/helper/index.dart';
import 'package:github_search_app/feature/explore_history/local/box/label_box.dart';
import 'package:github_search_app/feature/explore_history/local/box/pr_box.dart';
import 'package:github_search_app/feature/pr/index.dart';
import 'package:github_search_app/feature/shared/index.dart';

class PrBasicInfoModel extends GithubElementModel {
  final String title; // PR 제목
  final String createdAt; // 생성 날짜
  final String repoOwnerLoginName; // 레포 소유자 이름
  final String repoTitle; // 레포 제목
  final List<LabelModel> labels; // 라벨 리스트
  final PrState prState; // PR 상태
  final String? prContent; // PR 내용 (MD)
  final String suggesterLoginName; // PR 제안자 이름
  final String suggesterProfileImg; // PR 제안자 프로필 이미지

  PrBasicInfoModel({
    required String nodeId,
    required this.title,
    required this.createdAt,
    required this.repoOwnerLoginName,
    required this.repoTitle,
    required this.labels,
    required this.prState,
    required this.prContent,
    required this.suggesterLoginName,
    required this.suggesterProfileImg,
  }) : super(DateTime.now(), GithubElementCategory.pr.tag, nodeId);

  factory PrBasicInfoModel.fromResponse(PrItemResponse response) {
    final parsedUrl = AppRegex.parseGitHubIssueUrl(response.url);

    return PrBasicInfoModel(
      nodeId: response.nodeId,
      title: response.title,
      createdAt: response.createdAt,
      repoOwnerLoginName: parsedUrl?[0] ?? '이름 없음',
      repoTitle: parsedUrl?[1] ?? '리포지토리 제목 없음',
      labels: response.labels.map((e) => LabelModel.fromResponse(e)).toList(),
      prState: PrState.getPrStateByValue(
        originState: response.state,
        draft: response.draft,
        isMerged: response.pullRequest.mergedAt != null,
      ),
      prContent: response.body,
      suggesterLoginName: response.user.login,
      suggesterProfileImg: response.user.avatarUrl,
    );
  }

  static PrBox toBox(PrBasicInfoModel model) => PrBox(
        nodeId: model.nodeId,
        title: model.title,
        createdAt: model.createdAt,
        repoOwnerLoginName: model.repoOwnerLoginName,
        repoTitle: model.repoTitle,
        labels: model.labels.map((e) => LabelBox.fromModel(e)).toList(),
        prContent: model.prContent,
        suggesterLoginName: model.suggesterLoginName,
        suggesterProfileImg: model.suggesterProfileImg,
        exploreDate: model.exploreDate,
        categoryTag: GithubElementCategory.pr.tag,
        prStateTag: model.prState.tag,
      );
}
