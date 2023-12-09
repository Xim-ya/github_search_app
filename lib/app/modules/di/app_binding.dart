import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/explore_history/repository/explore_history_repository.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:github_search_app/presentation/pages/home/index.dart';
import 'package:github_search_app/presentation/pages/splash/index.dart';

///
/// DI를 등록하는 모듈
///

abstract class AppBinding {
  const AppBinding._();

  /// 초기에 등록이 되어야하는 모듈
  static void initialDependencies() {
    locator.registerFactory(() => SplashViewModel());
    locator.registerFactory(() => HomeViewModel());
    locator.registerLazySingleton(() => SomeProvider());
    locator.registerLazySingleton(
        () => FavoriteFriendStateNotifier(locator<UserRepository>()));
    locator.registerLazySingleton(
        () => ExploreHistoryStateNotifier(locator<ExploreHistoryRepository>()));
  }

  /// DI 등록 메소드
  static void dependencies() {
    initialDependencies();
    InjectModules.register();
  }
}
