import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/explore_history/repository/explore_history_repository.dart';
import 'package:github_search_app/feature/shared/models/github_element_model.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/pages/detail/index.dart';
import 'package:github_search_app/presentation/pages/home/index.dart';

class DetailViewModel extends BaseViewModel {
  DetailViewModel(
    this.routeArg,
    this._exploreHistoryRepository,
    this._exploreHistoryStateNotifier,
  );

  ///
  /// 이전화면으로 전달받은 인자
  ///
  final DetailPageRouteArg routeArg;

  ///
  /// 선택된 검색 카테고리
  ///
  GithubElementCategory get selectedCategory => routeArg.selectedCategory;

  ///
  /// [UserMetric] enum 값에 맞는
  /// 숫자(팔로워 수, 팔로잉..) 데이터를 리턴하는 메소드
  ///
  int getCountByMetricInfo(UserMetric metric) {
    final userInfo = locator<UserDetailStateNotifier>().userDetailInfo.value;

    switch (metric) {
      case UserMetric.repository:
        return userInfo.repoCount;
      case UserMetric.following:
        return userInfo.followingCount;
      case UserMetric.followers:
        return userInfo.followersCount;
    }
  }

  ///
  /// 상단 즐겨찾기 버튼 노출 여부
  ///
  bool isFavoriteBtnAvailable = false;

  ///
  /// 상단 즐겨 찾기 버튼 노출 여부 설정
  ///
  void setFavoriteBtnAvailable() {
    isFavoriteBtnAvailable = true;
    notifyListeners();
  }

  ///
  /// 즐겨찾기 등록 여부
  ///
  bool isUserSetToFavorite = false;

  ///
  /// 상단 즐겨 찾기 버튼 토글
  ///
  void toggleFavoriteBtnState() {
    isUserSetToFavorite = !isUserSetToFavorite;
    notifyListeners();
  }

  ///
  /// 탐색 기록 레포지토리
  ///
  final ExploreHistoryRepository _exploreHistoryRepository;

  ///
  /// 탐색 기록 StateNotifier
  ///
  final ExploreHistoryStateNotifier _exploreHistoryStateNotifier;

  ///
  /// 유저 탐색 기록 업데이트
  ///
  Future<void> updateUserExploreHistory(
      {required GithubElementModel item,
      required GithubElementCategory category}) async {
    _exploreHistoryStateNotifier.updateUserExploreHistory(
      item: item,
      category: category,
    );
  }
}
