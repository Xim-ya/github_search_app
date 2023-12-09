import 'package:flutter/material.dart';

class AppSize {
  AppSize._();

  late MediaQueryData mediaQuery;
  late double statusBarHeight; // Safe Area 상단 Inset
  late double bottomInset; // Safe Area 하단 Inset
  late double screenWidth; // 디바이스 넓이
  late double screenHeight; // 디바이스 높이
  late double devicePixelRatio; // 디바이스 픽셀 비율
  late bool isOverMaxWidth; // 최대 고정 넓이 초과 여부

  final double maxWidth = 1140; // 최대 넓이
  final double tabletWidth = 865; // 테블릿 넓이

  // 초기화 구문
  void init(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    isOverMaxWidth = mediaQuery.size.width >= maxWidth;
    statusBarHeight = mediaQuery.padding.top;
    bottomInset = mediaQuery.padding.bottom;
    devicePixelRatio = mediaQuery.devicePixelRatio;
    screenWidth = isOverMaxWidth ? maxWidth : mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
  }

  static final AppSize to = AppSize._();
}
