import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/app/modules/alert/app_toast.dart';
import 'package:github_search_app/app/modules/data_handling/data_state.dart';
import 'package:github_search_app/feature/explore_history/repository/explore_history_repository.dart';
import 'package:github_search_app/feature/shared/models/github_element_model.dart';
import 'package:github_search_app/presentation/base/base_state_notifier.dart';

class ExploreHistoryStateNotifier extends BaseStateNotifier {
  ExploreHistoryStateNotifier(
    this._repository,
  );

  ///
  /// 탐색 기록 레포지토리
  ///
  final ExploreHistoryRepository _repository;

  ///
  /// 탐색 기록 리스트
  ///
  Ds<List<GithubElementModel>> exploreHistories = Loading();

  ///
  /// 탐색 기록 호출
  ///
  void _fetchExploreHistories() async {
    final response = _repository.getExploreHistories();
    response.fold(onSuccess: (histories) {
      exploreHistories = Fetched(histories);
    }, onFailure: (e) {
      AppToast.errorToast(context, e, text: '탐색 기록을 불러오는 데 실패하였습니다.');
    });
  }

  ///
  /// 유저 탐색 기록 업데이트
  ///
  Future<void> updateUserExploreHistory(
      {required dynamic item, required GithubElementCategory category}) async {
    final response = await _repository.addItemToExploreHistory(
        item: item, category: category);

    response.fold(onSuccess: (_) {
      item as GithubElementModel;

      exploreHistories.value.removeWhere((e) => e.nodeId == item.nodeId);

      exploreHistories.value.insert(0, item);

      if (exploreHistories.value.length > 10) {
        exploreHistories.value.removeLast();
      }
      notifyListeners();
    }, onFailure: (e) {
      AppToast.errorToast(context, e, text: '탐색 기록을 저장하지 못하였습니다.');
    });
  }

  @override
  void onInit() {
    super.onInit();
    _fetchExploreHistories();
  }
}
