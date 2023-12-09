import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/presentation/pages/favorite_users/favorite_users_view_model.dart';
import 'package:github_search_app/presentation/pages/home/state/favorite_user_state_notifier.dart';

class FavoriteUsersBinding extends RouteBinding {
  @override
  void dependencies() {
    super.dependencies();
    locator.registerFactory(
      () => FavoriteUsersViewModel(locator<FavoriteFriendStateNotifier>()),
    );
  }

  @override
  void unRegisterDependencies() {
    super.unRegisterDependencies();
    locator.unregister<FavoriteUsersViewModel>();
  }
}
