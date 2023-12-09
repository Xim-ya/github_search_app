import 'package:github_search_app/app/constant/enum/pr_state.enum.dart';
import 'package:github_search_app/feature/explore_history/local/box/label_box.dart';
import 'package:github_search_app/feature/pr/index.dart';
import 'package:github_search_app/feature/shared/index.dart';
import 'package:github_search_app/feature/shared/models/github_element_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'pr_box.g.dart';

@HiveType(typeId: 4)
class PrBox with HiveObjectMixin implements GithubElementModel {
  @HiveField(0)
  final String title; // PR 제목

  @HiveField(1)
  final String createdAt; // 생성 날짜

  @HiveField(2)
  final String repoOwnerLoginName; // 레포 소유자 이름

  @HiveField(3)
  final String repoTitle; // 레포 제목

  @HiveField(4)
  final List<LabelBox> labels; // 라벨 리스트

  @HiveField(5)
  final String prStateTag; // PR 상태

  @HiveField(6)
  final String? prContent; // PR 내용 (MD)

  @HiveField(7)
  final String suggesterLoginName; // PR 제안자 이름

  @HiveField(8)
  final String suggesterProfileImg; // PR 제안자 프로필 이미지

  @override
  @HiveField(9)
  final DateTime exploreDate; // 탐색 날짜

  @override
  @HiveField(10)
  final String categoryTag;

  @HiveField(11)
  final String nodeId;

  PrBox({
    required this.nodeId,
    required this.title,
    required this.createdAt,
    required this.repoOwnerLoginName,
    required this.repoTitle,
    required this.labels,
    required this.prStateTag,
    required this.prContent,
    required this.suggesterLoginName,
    required this.suggesterProfileImg,
    required this.exploreDate,
    required this.categoryTag,
  });

  static PrBasicInfoModel toModel(PrBox box) => PrBasicInfoModel(
        nodeId: box.nodeId,
        title: box.title,
        createdAt: box.createdAt,
        repoOwnerLoginName: box.repoOwnerLoginName,
        repoTitle: box.repoTitle,
        labels: box.labels.map((e) => LabelModel.fromBox(e)).toList(),
        prState: PrState.getStateByTag(box.prStateTag),
        prContent: box.prContent,
        suggesterLoginName: box.suggesterLoginName,
        suggesterProfileImg: box.suggesterProfileImg,
      );
}
