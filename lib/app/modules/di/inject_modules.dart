import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/explore_history/index.dart';
import 'package:github_search_app/feature/issue/index.dart';
import 'package:github_search_app/feature/pr/index.dart';
import 'package:github_search_app/feature/repo/index.dart';
import 'package:github_search_app/feature/repo/repository/repo_repository_impl.dart';
import 'package:github_search_app/feature/user/index.dart';

abstract class InjectModules {
  const InjectModules._();

  static void register() {
    /// User
    locator
      ..registerLazySingleton(() => UserApi(AppDio.getInstance()))
      ..registerLazySingleton<UserDataSource>(
          () => UserDataSourceImpl(locator<UserApi>(), locator<UserDao>()))
      ..registerLazySingleton<UserRepository>(
          () => UserRepositoryImpl(locator<UserDataSource>()));

    /// Repository
    locator
      ..registerLazySingleton(() => RepoApi(AppDio.getInstance()))
      ..registerLazySingleton<RepoDataSource>(
          () => RepoDataSourceImpl(locator<RepoApi>()))
      ..registerLazySingleton<RepoRepository>(
          () => RepoRepositoryImpl(locator<RepoDataSource>()));

    /// Issue
    locator
      ..registerLazySingleton(() => IssueApi(AppDio.getInstance()))
      ..registerLazySingleton<IssueDataSource>(
          () => IssueDataSourceImpl(locator<IssueApi>()))
      ..registerLazySingleton<IssueRepository>(
          () => IssueRepositoryImpl(locator<IssueDataSource>()));

    /// PR
    locator
      ..registerLazySingleton(() => PrApi(AppDio.getInstance()))
      ..registerLazySingleton<PrDataSource>(
          () => PrDataSourceImpl(locator<PrApi>()))
      ..registerLazySingleton<PrRepository>(
          () => PrRepositoryImpl(locator<PrDataSource>()));

    /// Explore History
    locator.registerLazySingleton<ExploreHistoryRepository>(
        () => ExploreHistoryRepositoryImpl(locator<ExploreHistoryDao>()));
  }
}
