import 'package:flutter/cupertino.dart';
import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/presentation/pages/search/index.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

part 'search_event_interface.dart';

mixin class SearchEvent implements _SearchEvent {
  @override
  void onCancelBtnTapped(BuildContext context) {
    context.pop();
  }

  @override
  void onInputChanged(BuildContext context, {required String input}) {
    context.read<SearchViewModel>().handleStateDependsOnInput(input);
  }

  @override
  void onSearchOptionTapped(BuildContext context,
      {required GithubElementCategory selectedCategory,
      required String keyword}) {
    final SearchedListPageRouteArg routeArg =
        (selectedCategory: selectedCategory, keyword: keyword);

    context.push('${AppPages.home}/${AppPages.search}/${AppPages.searchedList}',
        extra: {'arg1': routeArg});
  }
}
