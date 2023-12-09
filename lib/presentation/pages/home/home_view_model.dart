import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/pages/home/event/home_event.dart';

class HomeViewModel extends BaseViewModel with HomeEvent {
  ///
  /// UI 컨트롤러
  ///
  final focusNode = FocusNode();
  final scrollController = ScrollController();

  ///
  /// 상단 영역으로 스크롤 되었는지 여부
  ///
  bool isScrollToTopPosition = true;

  ///
  /// 스크롤 컨트롤러 리스너 등록 메소드
  /// 스크롤 포지션에 따라 UI state값을 변경
  ///
  void setControllerListener() {
    scrollController.addListener(
      () {
        double offset = scrollController.offset;

        final effectPosition = headerTopInset + betweenHeaderInset + 30;

        if (offset >= effectPosition && isScrollToTopPosition == true) {
          isScrollToTopPosition = false;
          notifyListeners();
        }

        if (offset < effectPosition && isScrollToTopPosition == false) {
          isScrollToTopPosition = true;
          notifyListeners();
        }
      },
    );
  }

  ///
  /// FocusNode 리스너 등록 메소드
  ///
  void setFocusNodeListener() {
    /// TextFeild에 Focus에 활성화 되면 [SearchPage]로 이동
    focusNode.addListener(
      () {
        if (focusNode.hasFocus) {
          focusNode.unfocus();
          routeToSearch(context);
        }
      },
    );
  }

  // bool Function(T notification);
  ///
  /// 마그네틱 스크롤 설정 메소드
  ///
  bool setMagneticPositionOnScroll(Object? scrollNotification) {
    if (scrollNotification is ScrollEndNotification &&
        scrollNotification.depth == 0) {
      // 뷰의 최대&최소 스크롤 가능한 범위
      final minExtent = scrollNotification.metrics.minScrollExtent;
      final maxExtent = scrollNotification.metrics.maxScrollExtent;

      // 최소 및 최대 범위 사이의 중간 지점
      final middle = (maxExtent - minExtent) / 2;

      //현재 스크롤 위치
      final currentPosition = scrollNotification.metrics.pixels;
      double? scrollTo;

      // 스크롤 위치를 기반으로 [scrollTo] 값 계산
      if (minExtent < currentPosition && currentPosition <= middle) {
        scrollTo = minExtent;
      } else if (middle < currentPosition && currentPosition < maxExtent) {
        scrollTo = maxExtent;
      }

      // 스크롤 포지션 이동
      if (scrollTo != null) {
        Timer(
          const Duration(milliseconds: 1),
          () => scrollController.animateTo(scrollTo!,
              duration: const Duration(milliseconds: 300), curve: Curves.ease),
        );
      }
    }
    return false;
  }

  ///
  /// [CollapsibleHeader] 상단 [SafeArea]간의 간격
  ///
  double headerTopInset = 12;

  ///
  /// [CollapsibleHeader] 상단 [SearchBar]간의 간격
  ///
  double betweenHeaderInset = 12;

  @override
  void onInit() {
    super.onInit();
    setControllerListener();
    setFocusNodeListener();
  }

  @override
  void onDispose() {
    super.onDispose();

    focusNode.dispose();
    scrollController.dispose();
  }
}
