import 'package:flutter/material.dart';
import 'package:github_search_app/app/modules/di/locator.dart';
import 'package:github_search_app/feature/pr/repository/models/pr_basic_info_model.dart';
import 'package:github_search_app/presentation/base/base_no_view_model_state_notifier.dart';
import 'package:github_search_app/presentation/common/divider/separate_line_divider.dart';
import 'package:github_search_app/presentation/common/list_tile/pr_list_tile.dart';
import 'package:github_search_app/presentation/common/list_view/pagination_list_view.dart';
import 'package:github_search_app/presentation/pages/common_state/searched_pr_state_notifier.dart';

class PagedPrListView
    extends BaseNoViewModelStateNotifierView<SearchedPrStateNotifier> {
  const PagedPrListView(this.instanceName, {Key? key}) : super(key: key);

  final String instanceName;

  @override
  Widget buildView(BuildContext context) {
    return ResponsivePagedListView<PrBasicInfoModel>(
      pagingController: sn(context).pagingController,
      separateView: SeparateDivider.thin(),
      itemBuilder: (BuildContext context, PrBasicInfoModel item, int index) {
        return PrListTile(
          item: item,
        );
      },
    );
  }

  @override
  SearchedPrStateNotifier createStateNotifier(BuildContext context) =>
      locator<SearchedPrStateNotifier>(instanceName: instanceName);
}
