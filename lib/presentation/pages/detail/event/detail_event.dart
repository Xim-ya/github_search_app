import 'package:flutter/cupertino.dart';
import 'package:github_search_app/app/modules/di/locator.dart';
import 'package:github_search_app/presentation/pages/detail/index.dart';
import 'package:provider/provider.dart';

part 'detail_event_interface.dart';

mixin class DetailEvent implements _DetailEvent {
  @override
  Future<void> onFavoriteBtnTapped(
    BuildContext context,
  ) async {
    final vm = context.read<DetailViewModel>();
    final isUserInFavorites = vm.isUserSetToFavorite;
    if (isUserInFavorites) {
      locator<UserDetailStateNotifier>().onDeleteUser();
    } else {
      locator<UserDetailStateNotifier>().onAddUser();
    }

    vm.toggleFavoriteBtnState();
  }
}
