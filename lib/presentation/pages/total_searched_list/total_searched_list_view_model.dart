import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/pages/total_searched_list/total_searched_list_binding.dart';

class TotalSearchedViewModel extends BaseViewModel {
  TotalSearchedViewModel(this.routeArg);

  ///
  /// 이전화면으로 전달받은 인자
  ///
  final SearchedListPageRouteArg routeArg;

  ///
  /// 선택된 검색 카테고리
  ///
  GithubElementCategory get selectedCategory => routeArg.selectedCategory;

  ///
  /// 각 StateNotifier 싱글톤 인스턴스 이름(tag)
  ///
  final String singletonInstanceName = totalListTag;

  @override
  void dispose() {
    super.dispose();
  }
}
