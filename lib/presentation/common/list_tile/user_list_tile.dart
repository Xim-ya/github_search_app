import 'package:flutter/material.dart';
import 'package:github_search_app/app/config/app_gap.dart';
import 'package:github_search_app/app/config/app_text_style.dart';
import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/app/modules/router/app_pages.dart';
import 'package:github_search_app/app/modules/router/route_argument.dart';
import 'package:github_search_app/feature/user/repository/models/user_basic_info_model.dart';
import 'package:github_search_app/presentation/common/image/profile_image.dart';
import 'package:go_router/go_router.dart';

class UserListTile extends StatelessWidget {
  const UserListTile(
      {Key? key,
      required this.item,
      this.borderRadius,
      this.ignoreTouchArea,
      this.width})
      : super(key: key);

  final UserBasicInfoModel item;
  final BorderRadius? borderRadius;
  final bool? ignoreTouchArea;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: ignoreTouchArea ?? false,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
        onPressed: () {
          final DetailPageRouteArg routeArg = (
            selectedCategory: GithubElementCategory.user,
            extra: item.loginName,
          );
          context.push(
            '${GoRouter.of(context).location}/${AppPages.detail}',
            extra: {
              'arg1': routeArg,
            },
          );
        },
        child: Container(
          width: width,
          height: 68,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ///  PROFILE IMAGE
              ProfileImage(imgUrl: item.profileImgUrl, size: 44),

              Gap.size12,

              /// NAME
              Text(
                item.loginName,
                style: AppTextStyle.title2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
