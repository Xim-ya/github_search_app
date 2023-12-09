import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search_app/app/config/app_color.dart';
import 'package:github_search_app/app/config/app_gap.dart';
import 'package:github_search_app/app/config/app_text_style.dart';
import 'package:github_search_app/app/constant/app_assets.dart';
import 'package:github_search_app/app/modules/exception/base_exception.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator(this.error, {Key? key}) : super(key: key);

  final Object? error;

  @override
  Widget build(BuildContext context) {
    late String errorText;

    if (error is BaseException) {
      errorText = (error as BaseException).message;
    } else {
      errorText = '알 수 없는 에러가 발생했습니다.';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.errorIndicator),
        Gap.size16,
        Text(
          errorText,
          style: AppTextStyle.body2.copyWith(
            color: AppColor.darkGrey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
