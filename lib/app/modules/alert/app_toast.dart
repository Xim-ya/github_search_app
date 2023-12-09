import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:github_search_app/app/config/index.dart';

abstract class AppToast {
  AppToast._();

  static void errorToast(
    BuildContext context,
    Object? e, {
    required String text,
  }) async {
    log(e.toString());
    showToastWidget(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          color: AppColor.black,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyle.alert2.copyWith(color: AppColor.white),
        ),
      ),
      context: context,
      animDuration: Duration.zero,
    );
  }
}
