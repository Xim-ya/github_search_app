import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/issue/index.dart';
import 'package:github_search_app/feature/pr/index.dart';
import 'package:github_search_app/feature/repo/index.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:github_search_app/presentation/pages/common_state/index.dart';
import 'package:github_search_app/presentation/pages/searched_list/index.dart';

class SearchedListBinding extends RouteBinding {
  @override
  void dependencies() {
    super.dependencies();

    locator
      ..registerFactory(() => SearchedListViewModel(arg1))
      ..registerLazySingleton(
          () => SearchedUsersStateNotifier(
                arg1,
                locator<UserRepository>(),
              ),
          instanceName: searchedListTag)
      ..registerLazySingleton(
          () => SearchedIssuesStateNotifier(
                arg1,
                locator<IssueRepository>(),
              ),
          instanceName: searchedListTag)
      ..registerLazySingleton(
          () => SearchedRepositoriesStateNotifier(
              arg1, locator<RepoRepository>()),
          instanceName: searchedListTag)
      ..registerLazySingleton(
          () => SearchedPrStateNotifier(arg1, locator<PrRepository>()),
          instanceName: searchedListTag)
      ..registerLazySingleton(
        () => SearchedTotalStateNotifier(
            routeArg: arg1,
            userRepository: locator<UserRepository>(),
            repoRepository: locator<RepoRepository>(),
            issueRepository: locator<IssueRepository>(),
            prRepository: locator<PrRepository>()),
      );
  }

  @override
  void unRegisterDependencies() {
    super.unRegisterDependencies();
    locator
      ..unregister<SearchedListViewModel>()
      ..unregister<SearchedUsersStateNotifier>(instanceName: searchedListTag)
      ..unregister<SearchedRepositoriesStateNotifier>(
          instanceName: searchedListTag)
      ..unregister<SearchedIssuesStateNotifier>(instanceName: searchedListTag)
      ..unregister<SearchedPrStateNotifier>(instanceName: searchedListTag)
      ..unregister<SearchedTotalStateNotifier>();
  }
}

const String searchedListTag = 'searchList';
