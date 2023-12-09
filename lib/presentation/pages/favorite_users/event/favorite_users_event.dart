import 'package:flutter/material.dart';
import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:github_search_app/presentation/pages/favorite_users/favorite_users_view_model.dart';
import 'package:provider/provider.dart';

part 'favorite_users_event_interface.dart';

mixin class FavoriteUsersEvent implements _FavoriteUsersEvent {
  @override
  Future<void> onFavoriteBtnTapped(BuildContext context,
      {required bool isFilled, required UserBox user}) async {
    if (isFilled) {
      context.read<FavoriteUsersViewModel>().removeUserFromList(user.loginName);
    } else {
      context.read<FavoriteUsersViewModel>().addUserFromList(user);
    }
  }
}
