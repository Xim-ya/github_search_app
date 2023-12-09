import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search_app/app/config/app_color.dart';
import 'package:github_search_app/app/config/app_gap.dart';
import 'package:github_search_app/app/config/app_text_style.dart';
import 'package:github_search_app/app/constant/app_assets.dart';
import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/app/constant/enum/language.enum.dart';
import 'package:github_search_app/app/modules/color/hex_color.dart';
import 'package:github_search_app/app/modules/router/app_pages.dart';
import 'package:github_search_app/app/modules/router/route_argument.dart';
import 'package:github_search_app/feature/repo/repository/models/repo_basic_info_model.dart';
import 'package:github_search_app/presentation/common/box/empty_box.dart';
import 'package:github_search_app/presentation/common/image/profile_image.dart';
import 'package:go_router/go_router.dart';

class RepositoryListTile extends StatelessWidget {
  const RepositoryListTile({Key? key, required this.item, this.borderRadius})
      : super(key: key);

  final RepoBasicInfoModel item;

  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.zero,
      ),
      onPressed: () {
        final DetailPageRouteArg routeArg = (
          selectedCategory: GithubElementCategory.repository,
          extra: item,
        );
        context.push(
          '${GoRouter.of(context).location}/${AppPages.detail}',
          extra: {'arg1': routeArg},
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16) +
            const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ///  PROFILE IMAGE & OWNER NAME
            Row(
              children: [
                ProfileImage(imgUrl: item.userProfileImgUrl, size: 26),
                Gap.size8,
                Text(
                  item.userLoginName,
                  style: AppTextStyle.body2.copyWith(
                    color: AppColor.strongGrey,
                  ),
                )
              ],
            ),

            Gap.size10,

            /// NAME
            Text(
              item.title,
              style: AppTextStyle.title3,
            ),

            Gap.size6,

            /// DESCRIPTION
            item.description != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      item.description ?? '',
                      style: AppTextStyle.body3,
                    ),
                  )
                : const EmptyBox(),

            Gap.size4,

            /// START & LANGUAGE
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  AppAssets.starIcon,
                ),
                Gap.size6,
                Text('${item.starCount}',
                    style: AppTextStyle.body2
                        .copyWith(color: AppColor.strongGrey)),
                Gap.size10,
                if (item.language != null)
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: HexColor(
                            Language.getLanguageByName(item.language!).color,
                          ),
                        ),
                      ),
                      Gap.size6,
                      Text('${item.language}',
                          style: AppTextStyle.body2
                              .copyWith(color: AppColor.strongGrey)),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
