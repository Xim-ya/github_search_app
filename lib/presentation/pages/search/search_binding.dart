import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/presentation/pages/search/index.dart';

class SearchBinding extends RouteBinding {
  @override
  void dependencies() {
    super.dependencies();

    locator.registerFactory(() => SearchViewModel());
  }

  @override
  void unRegisterDependencies() {
    super.unRegisterDependencies();

    safeUnregister<SearchViewModel>();
  }
}
