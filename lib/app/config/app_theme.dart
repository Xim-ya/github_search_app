import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_search_app/app/config/index.dart';

class AppTheme {
  final _theme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    useMaterial3: true,
    splashFactory: NoSplash.splashFactory,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.white,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(
          Colors.grey.withOpacity(0.2),
        ),
      ),
    ),

    // 플랫폼별 라우팅 애니메이션 속성
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  static ThemeData get basicTheme => AppTheme()._theme;
}
