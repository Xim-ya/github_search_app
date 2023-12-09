import 'package:flutter/material.dart';
import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/issue/index.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/pages/detail/detail_view_model.dart';
import 'package:provider/provider.dart';

class IssueDetailStateNotifier extends BaseStateNotifier {
  IssueDetailStateNotifier(this._routeArg);

  ///
  /// 이전화면으로 전달받은 인자
  ///
  final DetailPageRouteArg _routeArg;

  ///
  /// 이슈 정보
  ///
  IssueBasicInfoModel get issueInfo => _routeArg.extra as IssueBasicInfoModel;

  ///
  /// 이슈 본문 (MD) 존재 여부
  ///
  bool get issueContentExist => issueInfo.issueContent != null;

  @override
  void onInit() {
    super.onInit();
    // 탐색기록 업데이트
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<DetailViewModel>().updateUserExploreHistory(
            item: IssueBasicInfoModel.toBox(issueInfo),
            category: GithubElementCategory.issue,
          );
    });
  }
}
