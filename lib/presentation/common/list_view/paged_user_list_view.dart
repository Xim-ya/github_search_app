import 'package:flutter/material.dart';
import 'package:github_search_app/app/modules/di/locator.dart';
import 'package:github_search_app/feature/user/repository/models/user_basic_info_model.dart';
import 'package:github_search_app/presentation/base/base_no_view_model_state_notifier.dart';
import 'package:github_search_app/presentation/common/list_tile/user_list_tile.dart';
import 'package:github_search_app/presentation/common/list_view/pagination_list_view.dart';
import 'package:github_search_app/presentation/pages/common_state/index.dart';
import 'package:github_search_app/presentation/pages/searched_list/index.dart';

class PagedUserListView
    extends BaseNoViewModelStateNotifierView<SearchedUsersStateNotifier>
    with SearchedListEvent {
  const PagedUserListView(this.instanceName, {Key? key, this.physics})
      : super(key: key);

  final ScrollPhysics? physics;
  final String instanceName;

  @override
  Widget buildView(BuildContext context) {
    return ResponsivePagedListView<UserBasicInfoModel>(
      pagingController: sn(context).pagingController,
      itemBuilder: (BuildContext context, UserBasicInfoModel item, int index) {
        return UserListTile(
          item: item,
        );
      },
    );
  }

  @override
  SearchedUsersStateNotifier createStateNotifier(BuildContext context) =>
      locator<SearchedUsersStateNotifier>(instanceName: instanceName);
}
