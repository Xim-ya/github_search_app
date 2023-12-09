import 'package:flutter/material.dart';

extension ImageExtension on num {
  ///
  /// 적정 이미지 캐시 리사이즈 값을
  /// 리턴하는 메소드
  ///
  int cacheSize(BuildContext context) {
    return (this * MediaQuery.of(context).devicePixelRatio).round();
  }
}
