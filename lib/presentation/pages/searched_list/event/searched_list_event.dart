import 'package:flutter/material.dart';
import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:go_router/go_router.dart';

part 'searched_list_event_interface.dart';

mixin class SearchedListEvent implements _SearchedListEvent {
  @override
  void routeToTotalSearchedResult(
    BuildContext context, {
    required GithubElementCategory selectedCategory,
    required String keyword,
    required int totalCount,
  }) {
    final SearchedListPageRouteArg routeArg = (
      selectedCategory: selectedCategory,
      keyword: keyword,
    );

    context.push(
        '${AppPages.home}/${AppPages.search}/${AppPages.searchedList}/${AppPages.totalSearchedList}',
        extra: {'arg1': routeArg});
  }
}
