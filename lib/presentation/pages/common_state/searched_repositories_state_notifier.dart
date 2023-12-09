import 'dart:developer';

import 'package:github_search_app/app/modules/router/route_argument.dart';
import 'package:github_search_app/feature/repo/repository/models/repo_basic_info_model.dart';
import 'package:github_search_app/feature/repo/repository/repo_repository.dart';
import 'package:github_search_app/presentation/base/base_paged_notifier_interface.dart';
import 'package:github_search_app/presentation/base/base_state_notifier.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchedRepositoriesStateNotifier extends BaseStateNotifier
    implements BasePagedNotifierInterface<RepoBasicInfoModel> {
  SearchedRepositoriesStateNotifier(this._routeArg, this._repository);

  ///
  /// 이전 화면으로 부터 전달 받은 인자
  ///
  final SearchedListPageRouteArg _routeArg;

  ///
  /// Repo 레포지토리
  ///
  final RepoRepository _repository;

  ///
  /// 현재 페이지
  ///
  @override
  int currentPage = BasePagedNotifierInterface.firstPage;

  ///
  /// 페이징 controller
  ///
  @override
  PagingController<int, RepoBasicInfoModel> pagingController =
      PagingController(firstPageKey: BasePagedNotifierInterface.firstPage);

  ///
  /// 페이징 데이터 호출
  ///
  @override
  Future<void> fetchPage() async {
    final response = await _repository.loadSearchedRepositories(
      query: _routeArg.keyword,
      perPage: BasePagedNotifierInterface.perPage,
      page: currentPage,
    );

    response.fold(
      onSuccess: (repositoryList) {
        /// 타겟 호출값의 개수보다 실제 호출된
        /// 데이터 개수가 적으면 마지막 호출로 간주
        final isLastPage =
            repositoryList.length < BasePagedNotifierInterface.perPage;

        if (isLastPage) {
          pagingController.appendLastPage(repositoryList);
        } else {
          currentPage += 1;
          pagingController.appendPage(repositoryList, currentPage);
        }
      },
      onFailure: (e) {
        log(e.toString());
        pagingController.error = e;
      },
    );
  }

  ///
  /// 페이지네이션 등록
  ///
  @override
  Future<void> initPagination() async {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage();
    });
  }

  @override
  void onInit() {
    super.onInit();
    initPagination();
  }

  @override
  void onDispose() {
    super.onDispose();
    pagingController.dispose();
  }
}
