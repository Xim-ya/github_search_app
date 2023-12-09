import 'package:flutter/material.dart';
import 'package:github_search_app/app/modules/di/locator.dart';
import 'package:github_search_app/feature/repo/repository/models/repo_basic_info_model.dart';
import 'package:github_search_app/presentation/base/base_no_view_model_state_notifier.dart';
import 'package:github_search_app/presentation/common/divider/separate_line_divider.dart';
import 'package:github_search_app/presentation/common/list_tile/repository_list_tile.dart';
import 'package:github_search_app/presentation/common/list_view/pagination_list_view.dart';
import 'package:github_search_app/presentation/pages/common_state/searched_repositories_state_notifier.dart';

class PagedRepositoryListView extends BaseNoViewModelStateNotifierView<
    SearchedRepositoriesStateNotifier> {
  const PagedRepositoryListView(this.instanceName, {Key? key})
      : super(key: key);

  final String instanceName;

  @override
  Widget buildView(BuildContext context) {
    return ResponsivePagedListView<RepoBasicInfoModel>(
      pagingController: sn(context).pagingController,
      separateView: SeparateDivider.thin(),
      itemBuilder: (BuildContext context, RepoBasicInfoModel item, int index) {
        return RepositoryListTile(
          item: item,
        );
      },
    );
  }

  @override
  SearchedRepositoriesStateNotifier createStateNotifier(BuildContext context) =>
      locator<SearchedRepositoriesStateNotifier>(instanceName: instanceName);
}
