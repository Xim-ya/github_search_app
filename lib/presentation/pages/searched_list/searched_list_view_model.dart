import 'package:flutter/material.dart';
import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/pages/searched_list/index.dart';

class SearchedListViewModel extends BaseViewModel {
  SearchedListViewModel(this.routeArg);

  ///
  /// 이전화면으로 전달받은 인자
  ///
  final SearchedListPageRouteArg routeArg;

  ///
  /// 선택된 검색 카테고리
  ///
  GithubElementCategory get selectedCategory => routeArg.selectedCategory;

  ///
  /// 인덱스별 ListTile 위젯의 BorderRadius 값
  ///
  BorderRadius? getBorderRadiusByIndex(
      {required int index, required int itemCount}) {
    switch (index) {
      case 0 when itemCount == 1:
        return const BorderRadius.all(Radius.circular(10));

      case 0 when itemCount >= 2:
        return const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        );

      case 1 when itemCount == 2:
        return const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        );

      case 2 when itemCount > 3:
        return const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        );
    }
    return null;
  }

  ///
  /// 각 StateNotifier 싱글톤 인스턴스 이름(tag)
  ///
  final String singletonInstanceName = searchedListTag;

  @override
  void onInit() async {
    super.onInit();
  }
}
