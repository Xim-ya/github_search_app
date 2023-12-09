import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/explore_history/repository/explore_history_repository.dart';
import 'package:github_search_app/feature/repo/index.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:github_search_app/presentation/pages/detail/index.dart';
import 'package:github_search_app/presentation/pages/home/index.dart';

class DetailBinding extends RouteBinding {
  @override
  void dependencies() {
    super.dependencies();

    locator
      ..registerFactory(() => DetailViewModel(
          arg1,
          locator<ExploreHistoryRepository>(),
          locator<ExploreHistoryStateNotifier>()))
      ..registerLazySingleton(
          () => RepoDetailStateNotifier(arg1, locator<RepoRepository>()))
      ..registerLazySingleton(() => UserDetailStateNotifier(arg1,
          locator<UserRepository>(), locator<FavoriteFriendStateNotifier>()))
      ..registerLazySingleton(() => IssueDetailStateNotifier(arg1))
      ..registerLazySingleton(() => PrDetailStateNotifier(arg1));
  }

  @override
  void unRegisterDependencies() {
    super.unRegisterDependencies();

    locator
      ..unregister<DetailViewModel>()
      ..unregister<UserDetailStateNotifier>()
      ..unregister<RepoDetailStateNotifier>()
      ..unregister<IssueDetailStateNotifier>()
      ..unregister<PrDetailStateNotifier>();
  }
}
