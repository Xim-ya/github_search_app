import 'package:flutter/material.dart';
import 'package:github_search_app/app/modules/di/locator.dart';
import 'package:github_search_app/feature/issue/repository/model/issue_basic_info_model.dart';
import 'package:github_search_app/presentation/base/base_no_view_model_state_notifier.dart';
import 'package:github_search_app/presentation/common/divider/separate_line_divider.dart';
import 'package:github_search_app/presentation/common/list_tile/issue_list_tile.dart';
import 'package:github_search_app/presentation/common/list_view/pagination_list_view.dart';
import 'package:github_search_app/presentation/pages/common_state/searched_issues_state_notifier.dart';

class PagedIssueListView
    extends BaseNoViewModelStateNotifierView<SearchedIssuesStateNotifier> {
  const PagedIssueListView(this.instanceName, {Key? key}) : super(key: key);

  final String instanceName;

  @override
  Widget buildView(BuildContext context) {
    return ResponsivePagedListView<IssueBasicInfoModel>(
      pagingController: sn(context).pagingController,
      separateView: SeparateDivider.thin(),
      itemBuilder: (BuildContext context, IssueBasicInfoModel item, int index) {
        return IssueListTile(
          item: item,
        );
      },
    );
  }

  @override
  SearchedIssuesStateNotifier createStateNotifier(BuildContext context) =>
      locator<SearchedIssuesStateNotifier>(instanceName: instanceName);
}
