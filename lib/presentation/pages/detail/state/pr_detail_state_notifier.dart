import 'package:flutter/material.dart';
import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/pr/index.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/pages/detail/detail_view_model.dart';
import 'package:provider/provider.dart';

class PrDetailStateNotifier extends BaseStateNotifier {
  PrDetailStateNotifier(this._routeArg);

  ///
  /// 이전화면으로 전달받은 인자
  ///
  final DetailPageRouteArg _routeArg;

  ///
  /// 이슈 정보
  ///
  PrBasicInfoModel get prInfo => _routeArg.extra as PrBasicInfoModel;

  ///
  /// PR 본문 (MD) 존재 여부
  ///
  bool get issueContentExist => prInfo.prContent != null;

  @override
  void onInit() {
    super.onInit();

    // 탐색기록 업데이트
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // 탐색기록 업데이트
      context.read<DetailViewModel>().updateUserExploreHistory(
            item: PrBasicInfoModel.toBox(prInfo),
            category: GithubElementCategory.pr,
          );
    });
  }
}
