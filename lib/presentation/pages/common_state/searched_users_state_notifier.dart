import 'dart:developer';

import 'package:github_search_app/app/modules/router/route_argument.dart';
import 'package:github_search_app/feature/user/repository/models/user_basic_info_model.dart';
import 'package:github_search_app/feature/user/repository/user_repository.dart';
import 'package:github_search_app/presentation/base/base_paged_notifier_interface.dart';
import 'package:github_search_app/presentation/base/base_state_notifier.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchedUsersStateNotifier extends BaseStateNotifier
    implements BasePagedNotifierInterface<UserBasicInfoModel> {
  SearchedUsersStateNotifier(this._routeArg, this._repository);

  ///
  /// 이전 화면으로 부터 전달 받은 인자
  ///
  final SearchedListPageRouteArg _routeArg;

  ///
  /// User 레포지토리
  ///
  final UserRepository _repository;

  ///
  /// 현재 페이지
  ///
  @override
  int currentPage = BasePagedNotifierInterface.firstPage;

  ///
  /// 페이징 controller
  ///
  @override
  PagingController<int, UserBasicInfoModel> pagingController =
      PagingController(firstPageKey: BasePagedNotifierInterface.firstPage);

  ///
  /// 페이징 데이터 호출
  ///
  @override
  Future<void> fetchPage() async {
    final response = await _repository.loadSearchedUserList(
        query: _routeArg.keyword,
        perPage: BasePagedNotifierInterface.perPage,
        page: currentPage);

    response.fold(
      onSuccess: (userList) {
        /// 타겟 호출값의 개수보다 실제 호출된
        /// 데이터 개수가 적으면 마지막 호출로 간주
        final isLastPage = userList.length < BasePagedNotifierInterface.perPage;

        if (isLastPage) {
          pagingController.appendLastPage(userList);
        } else {
          currentPage += 1;
          pagingController.appendPage(userList, currentPage);
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

    print("USER INITIALIZEd");
  }

  @override
  void onDispose() {
    super.onDispose();
    pagingController.dispose();
    print('아지랑이[SearchedUsersStateNotifier] - 해제');
  }
}
