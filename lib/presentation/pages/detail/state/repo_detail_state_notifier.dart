import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/repo/index.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/pages/detail/detail_view_model.dart';
import 'package:provider/provider.dart';

class RepoDetailStateNotifier extends BaseStateNotifier {
  RepoDetailStateNotifier(this._routeArg, this._repoRepository);

  ///
  /// 레포지터리 모듈
  ///
  final RepoRepository _repoRepository;

  ///
  /// 이전화면으로 전달받은 인자
  ///
  final DetailPageRouteArg _routeArg;

  ///
  /// 레포 리드미 정보
  ///
  Ds<String> readMeContent = Loading();

  ///
  /// 레포 정보
  ///
  RepoBasicInfoModel get repoInfo => _routeArg.extra as RepoBasicInfoModel;

  ///
  /// 레포지터리 리드미 데이터 호출
  ///
  Future<void> _getRepoReadMe() async {
    final response = await _repoRepository.loadReadMeContent(
      userLoginName: repoInfo.userLoginName,
      repoTitle: repoInfo.title,
    );

    response.fold(
      onSuccess: (content) {
        final decodedContent = _getDecodedContent(content);
        readMeContent = Fetched(decodedContent);
      },
      onFailure: (e) {
        readMeContent = Failed(e);
      },
    );

    notifyListeners();
  }

  ///
  /// 깃허브 리드미 콘텐츠 디코딩
  ///
  String _getDecodedContent(String content) {
    final filteredContent = content.replaceAll(RegExp(r'\s+'), '');
    List<int> decodedBytes = base64.decode(filteredContent);
    String decodedContent = utf8.decode(decodedBytes);

    return decodedContent;
  }

  @override
  void onInit() {
    super.onInit();
    // 탐색기록 업데이트
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<DetailViewModel>().updateUserExploreHistory(
            item: RepoBasicInfoModel.toBox(repoInfo),
            category: GithubElementCategory.repository,
          );
    });

    _getRepoReadMe();
  }
}
