import 'package:flutter/material.dart';
import 'package:github_search_app/app/config/index.dart';

abstract class AppSnackBar {
  AppSnackBar._();

  static void showSnackBar(BuildContext context, {required String text}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 800),
        content: Text(
          text,
          style: AppTextStyle.alert2.copyWith(
            color: AppColor.white,
          ),
        ),
      ),
    );
  }
}
