import 'package:github_search_app/presentation/base/base_state_notifier.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

///
/// [infinite_scroll_pagination]을 사용하여 페이지네이션 기능을 구현.
/// 여러 [BaseStateNotifier]에서 해당 기능 사용하는데,
/// 이때 공통적으로 사용되는 기능과 변수들을 추상화하여 모듈화함.
///

abstract class BasePagedNotifierInterface<T> {
  ///
  /// 페이지당 피드 리스트 호출 개수 (limit)
  ///
  static const int perPage = 30;

  ///
  /// 초기 페이지 값
  ///
  static const int firstPage = 1;

  ///
  /// 페이징 컨트롤러
  ///
  late PagingController<int, T> pagingController;

  ///
  /// 현재 페이지
  ///
  late int currentPage = perPage;

  ///
  /// 페이지 호출
  ///
  Future<void> fetchPage();

  ///
  /// 페이지 초기 등록
  ///
  Future<void> initPagination();
}
