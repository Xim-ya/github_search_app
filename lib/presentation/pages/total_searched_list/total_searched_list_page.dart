import 'package:flutter/material.dart';
import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/common/index.dart';
import 'package:github_search_app/presentation/pages/total_searched_list/index.dart';

class TotalSearchedListPage extends BasePage<TotalSearchedViewModel> {
  const TotalSearchedListPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return GithubElementCategory.branch(
        targetCategory: vm(context).selectedCategory,
        user: (_) => PagedUserListView(vm(context).singletonInstanceName),
        repository: (_) =>
            PagedRepositoryListView(vm(context).singletonInstanceName),
        issue: (_) => PagedIssueListView(vm(context).singletonInstanceName),
        pr: (_) => PagedPrListView(vm(context).singletonInstanceName));
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => BackButtonAppBar(
        title: vm(context).routeArg.selectedCategory.name,
      );

  @override
  bool get wrapWithSafeArea => false;
}
