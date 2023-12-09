import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/feature/explore_history/local/box/repo_box.dart';
import 'package:github_search_app/feature/repo/api/response/repo_item_response.dart';
import 'package:github_search_app/feature/shared/models/github_element_model.dart';

class RepoBasicInfoModel extends GithubElementModel {
  final String userLoginName; // 레포 소유자 이름
  final String userProfileImgUrl; // 레포 소유자 프로필 이미지,
  final String title; // 레포 제목
  final String? description; // 레포 설명
  final String? language; // 프로그래밍 언어
  final int starCount; // 스타 개수
  final int forkCount; // 포크 개수

  RepoBasicInfoModel({
    required String nodeId,
    required this.userLoginName,
    required this.userProfileImgUrl,
    required this.title,
    required this.description,
    required this.language,
    required this.starCount,
    required this.forkCount,
  }) : super(DateTime.now(), GithubElementCategory.repository.tag, nodeId);

  factory RepoBasicInfoModel.fromResponse(RepoItemResponse response) =>
      RepoBasicInfoModel(
        nodeId: response.nodeId,
        userLoginName: response.owner.login,
        userProfileImgUrl: response.owner.avatarUrl,
        title: response.name,
        description: response.description,
        language: response.language,
        starCount: response.stargazersCount,
        forkCount: response.forksCount,
      );

  static RepoBox toBox(RepoBasicInfoModel model) => RepoBox(
        nodeId: model.nodeId,
        userLoginName: model.userLoginName,
        userProfileImgUrl: model.userProfileImgUrl,
        title: model.title,
        description: model.description,
        language: model.language,
        starCount: model.starCount,
        forkCount: model.forkCount,
        exploreDate: model.exploreDate,
        categoryTag: GithubElementCategory.repository.tag,
      );
}
