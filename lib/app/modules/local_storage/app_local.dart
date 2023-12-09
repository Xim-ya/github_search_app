import 'package:github_search_app/app/modules/di/locator.dart';
import 'package:github_search_app/feature/explore_history/index.dart';
import 'package:github_search_app/feature/shared/index.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

abstract class AppLocal {
  AppLocal._();

  static String exploreBox = 'explore';
  static String userBox = 'user';

  static void initHive() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);

    Hive
      ..registerAdapter(UserListBoxAdapter())
      ..registerAdapter(UserBoxAdapter())
      ..registerAdapter(ExploreHistoryCollectionBoxAdapter())
      ..registerAdapter(RepoBoxAdapter())
      ..registerAdapter(IssueBoxAdapter())
      ..registerAdapter(PrBoxAdapter())
      ..registerAdapter(AssignerBoxAdapter())
      ..registerAdapter(LabelBoxAdapter());

    final Box<UserListBox> userBox =
        await Hive.openBox<UserListBox>(AppLocal.userBox);
    final Box<ExploreHistoryCollectionBox> exploreBox =
        await Hive.openBox<ExploreHistoryCollectionBox>(AppLocal.exploreBox);

    // userBox.clear();
    // exploreBox.clear();
    locator
      ..registerLazySingleton(() => UserDao(userBox))
      ..registerLazySingleton(() => ExploreHistoryDao(exploreBox));
  }
}
