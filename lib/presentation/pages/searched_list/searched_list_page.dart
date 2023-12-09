import 'package:flutter/material.dart';
import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/presentation/base/base_page.dart';
import 'package:github_search_app/presentation/common/index.dart';
import 'package:github_search_app/presentation/pages/searched_list/index.dart';

class SearchedListPage extends BasePage<SearchedListViewModel>
    with SearchedListEvent {
  const SearchedListPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return GithubElementCategory.branchAll(
      targetCategory: vm(context).selectedCategory,
      user: (_) => PagedUserListView(vm(context).singletonInstanceName),
      repository: (_) =>
          PagedRepositoryListView(vm(context).singletonInstanceName),
      issue: (_) => PagedIssueListView(vm(context).singletonInstanceName),
      pr: (_) => PagedPrListView(vm(context).singletonInstanceName),
      total: (_) => const TotalCollectionListView(),
    );
  }

  @override
  bool get setBottomSafeArea => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => BackButtonAppBar(
        title: vm(context).routeArg.selectedCategory.name,
      );
}
