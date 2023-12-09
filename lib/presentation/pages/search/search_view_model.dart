import 'package:flutter/material.dart';
import 'package:github_search_app/presentation/base/index.dart';

class SearchViewModel extends BaseViewModel {
  ///
  /// UI 컨트롤러
  ///
  final focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();

  ///
  /// [TextField] 마운트 여부
  ///
  bool isTextFieldMounted = false;

  ///
  /// [TextField] input 입력값 존재 여부
  ///
  bool isInputFilled = false;

  ///
  /// [TextField]에 입력된 검색어
  ///
  String searchedKeyword = '';

  ///
  /// 유저가 [TextField]에 검색어를 입력했을 때
  /// 입력값에 영향을 받는 아래 state 값들을 업데이트
  /// 1. 검색 옵션 노출 여부
  /// 2. 검색어
  ///
  void handleStateDependsOnInput(String input) {
    /// [NOTE]: 'isEmpty'를 조건문에 사용 X
    if (input == '') {
      if (isInputFilled == true) {
        isInputFilled = false;
        notifyListeners();
      }
      return;
    }

    if (isInputFilled == false) {
      isInputFilled = true;
    }
    searchedKeyword = input;
    notifyListeners();
  }

  ///
  /// 애니메이션 효과를 위한
  /// 선택 옵션 타일의 초기 spread 포지션
  ///
  double getSpreadTilePosition(int index) {
    if (index == 0) {
      return 0;
    } else {
      return index * 200;
    }
  }

  ///
  /// TextField Focus 활성화 메소드
  /// [Hero] 애니메이션 감싸져 있는 [TextField]는
  /// 즉시 Focus를 활성화 할 수 없는 이슈가 있음
  /// https://github.com/flutter/flutter/issues/106789
  ///
  /// 이를 해결하기 위해 Hero 애니메이션 작동된 이후
  /// focus를 활성화 시켜주어야 함.
  ///
  void setFocusPosition() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
      isTextFieldMounted = true;
    });
  }

  @override
  void onDispose() {
    super.onDispose();

    textEditingController.dispose();
    focusNode.dispose();
  }
}
