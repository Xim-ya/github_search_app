import 'package:flutter/material.dart';
import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:go_router/go_router.dart';

part 'home_event_interface.dart';

mixin class HomeEvent implements _HomeEvent {
  @override
  void routeToUserDetail(BuildContext context, String userLoginName) {
    final DetailPageRouteArg routeArg = (
      selectedCategory: GithubElementCategory.user,
      extra: userLoginName,
    );

    context.push(
      '${AppPages.home}/${AppPages.detail}',
      extra: {'arg1': routeArg},
    );
  }

  @override
  void routeToFavoriteUsers(BuildContext context) {
    context.push(
      '${AppPages.home}/${AppPages.favoriteUsers}',
    );
  }

  @override
  void routeToSearch(BuildContext context) {
    context.push(
      '${AppPages.home}/${AppPages.search}',
    );
  }
}
