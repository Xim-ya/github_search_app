import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:github_search_app/app/config/app_color.dart';
import 'package:github_search_app/app/config/app_text_style.dart';
import 'package:github_search_app/app/constant/app_assets.dart';
import 'package:go_router/go_router.dart';

class BackButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackButtonAppBar({
    super.key,
    this.title,
    this.onBackBtnTapped,
    this.actions,
  });

  final String? title;
  final VoidCallback? onBackBtnTapped;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.2,
            color: AppColor.darkGrey,
          ),
        ),
      ),
      child: AppBar(
        forceMaterialTransparency: true,
        titleSpacing: 0,
        backgroundColor: AppColor.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leadingWidth: 56,
        actions: actions,
        title: Text(
          title ?? '',
          style: AppTextStyle.headline4,
        ),
        leading: SizedBox(
          child: IconButton(
            onPressed: onBackBtnTapped ?? context.pop,
            icon: SvgPicture.asset(AppAssets.arrowLeftIcon),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
