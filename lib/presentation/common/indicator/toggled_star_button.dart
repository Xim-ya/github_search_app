import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search_app/app/config/index.dart';
import 'package:github_search_app/app/constant/index.dart';

class ToggledStarButton extends StatelessWidget {
  const ToggledStarButton(
      {Key? key, required this.isFilled, required this.onTap})
      : super(key: key);

  final bool isFilled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      padding: EdgeInsets.zero,
      onPressed: onTap,
      icon: SvgPicture.asset(
        isFilled ? AppAssets.starFilledIcon : AppAssets.starIcon,
        width: 24,
        colorFilter: const ColorFilter.mode(
          AppColor.yellow,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
