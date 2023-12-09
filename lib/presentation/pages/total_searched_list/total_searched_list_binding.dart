import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/issue/index.dart';
import 'package:github_search_app/feature/pr/index.dart';
import 'package:github_search_app/feature/repo/index.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:github_search_app/presentation/pages/common_state/index.dart';
import 'package:github_search_app/presentation/pages/total_searched_list/index.dart';

class TotalSearchedListBinding extends RouteBinding {
  @override
  void dependencies() {
    super.dependencies();

    locator
      ..registerFactory(() => TotalSearchedViewModel(arg1))
      ..registerLazySingleton(
        () => SearchedIssuesStateNotifier(
          arg1,
          locator<IssueRepository>(),
        ),
        instanceName: totalListTag,
      )
      ..registerLazySingleton(
        () => SearchedUsersStateNotifier(arg1, locator<UserRepository>()),
        instanceName: totalListTag,
      )
      ..registerLazySingleton(
        () =>
            SearchedRepositoriesStateNotifier(arg1, locator<RepoRepository>()),
        instanceName: totalListTag,
      )
      ..registerLazySingleton(
        () => SearchedPrStateNotifier(
          arg1,
          locator<PrRepository>(),
        ),
        instanceName: totalListTag,
      );
  }

  @override
  void unRegisterDependencies() {
    super.unRegisterDependencies();

    locator
      ..unregister<TotalSearchedViewModel>()
      ..unregister<SearchedUsersStateNotifier>(instanceName: totalListTag)
      ..unregister<SearchedRepositoriesStateNotifier>(
          instanceName: totalListTag)
      ..unregister<SearchedIssuesStateNotifier>(instanceName: totalListTag)
      ..unregister<SearchedPrStateNotifier>(instanceName: totalListTag);
  }
}

const String totalListTag = 'totalList';
