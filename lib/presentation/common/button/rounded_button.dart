import 'package:flutter/material.dart';
import 'package:github_search_app/app/config/app_color.dart';
import 'package:github_search_app/app/config/app_text_style.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.onTap,
      required this.backgroundColor,
      required this.text,
      required this.textColor})
      : super(key: key);

  final VoidCallback onTap;
  final Color backgroundColor;
  final String text;
  final Color textColor;

  factory RoundedButton.filled({
    required String text,
    required VoidCallback onTap,
  }) =>
      RoundedButton(
        onTap: onTap,
        backgroundColor: AppColor.blue,
        text: text,
        textColor: AppColor.white,
      );

  factory RoundedButton.outline({
    required String text,
    required VoidCallback onTap,
  }) =>
      RoundedButton(
        onTap: onTap,
        backgroundColor: AppColor.white,
        text: text,
        textColor: AppColor.blue,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0.2,
      highlightElevation: 0,
      focusColor: Colors.blue,
      height: 48,
      padding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      minWidth: double.infinity,
      onPressed: onTap,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: backgroundColor == AppColor.white
            ? const BorderSide(
                width: 0.2,
                color: AppColor.darkGrey,
              )
            : BorderSide.none,
      ),
      child: Text(
        text,
        style: AppTextStyle.title2.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
