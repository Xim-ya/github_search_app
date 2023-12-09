import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search_app/app/config/app_color.dart';
import 'package:github_search_app/app/config/app_gap.dart';
import 'package:github_search_app/app/config/app_text_style.dart';
import 'package:github_search_app/app/constant/app_assets.dart';
import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/app/helper/extension/image_extension.dart';
import 'package:github_search_app/app/helper/extension/string_extension.dart';
import 'package:github_search_app/app/modules/color/hex_color.dart';
import 'package:github_search_app/app/modules/router/app_pages.dart';
import 'package:github_search_app/app/modules/router/route_argument.dart';
import 'package:github_search_app/feature/issue/repository/model/issue_basic_info_model.dart';
import 'package:github_search_app/presentation/common/box/empty_box.dart';
import 'package:go_router/go_router.dart';

class IssueListTile extends StatelessWidget {
  const IssueListTile(
      {Key? key, required this.item, this.borderRadius, this.ignoreTouchArea})
      : super(key: key);

  final IssueBasicInfoModel item;
  final BorderRadius? borderRadius;
  final bool? ignoreTouchArea;

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
          final DetailPageRouteArg routeArg =
              (selectedCategory: GithubElementCategory.issue, extra: item);
          context.push(
            '${GoRouter.of(context).location}/${AppPages.detail}',
            extra: {'arg1': routeArg},
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16) +
              const EdgeInsets.only(top: 10, bottom: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// ISSUE ICON
              SvgPicture.asset(
                item.state.icon,
                colorFilter: ColorFilter.mode(
                  item.state.color,
                  BlendMode.srcIn,
                ),
              ),

              Gap.size16,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /// NAME & REPO TITLE  & CREATED AT
                    /// NOTE : 제목에만 textoverflow를 적용하기 위해 RichText를 적용하지 않아야 함.
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(text: item.repoOwnerLoginName),
                                const TextSpan(text: ' / '),
                                TextSpan(text: item.repoTitle),
                              ],
                              style: AppTextStyle.body2
                                  .copyWith(color: AppColor.darkGrey),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Gap.size2,
                        Text(
                          item.createdAt.getDateDifferenceFromNow,
                          style: AppTextStyle.body2
                              .copyWith(color: AppColor.darkGrey),
                        )
                      ],
                    ),
                    Gap.size4,
                    Text(
                      item.title,
                      style: AppTextStyle.title3,
                    ),
                    Gap.size6,

                    /// LABEL LIST
                    Wrap(
                      children: [
                        ...List.generate(
                          item.labels.length,
                          (index) {
                            final label = item.labels[index];
                            return Container(
                              margin:
                                  const EdgeInsets.only(right: 4, bottom: 6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: HexColor(label.color),
                              ),
                              child: Text(
                                label.name,
                                style: AppTextStyle.alert2.copyWith(
                                  color: label.color == '000000'
                                      ? AppColor.white
                                      : AppColor.black,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    SizedBox(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          /// ASSIGNEES
                          Wrap(
                            children: <Widget>[
                              ...List.generate(
                                item.assignees.length,
                                (index) => Transform.translate(
                                  offset: Offset(index * -10, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                          width: 2, color: AppColor.white),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(11),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            item.assignees[index].avatarUrl,
                                        memCacheHeight: 22.cacheSize(context),
                                        height: 22,
                                        width: 22,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          /// COMMENT COUNT
                          Builder(builder: (context) {
                            if (item.commentCount > 0) {
                              return Transform.translate(
                                offset: Offset(
                                    item.assignees.isNotEmpty
                                        ? item.assignees.length * -10 + 14
                                        : 0,
                                    0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      100,
                                    ),
                                    border: Border.all(
                                        color: AppColor.lightGrey, width: 0.2),
                                  ),
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                        AppAssets.commentIcon,
                                      ),
                                      Gap.size4,
                                      Text(
                                        '${item.commentCount}',
                                        style: AppTextStyle.alert1
                                            .copyWith(color: AppColor.darkGrey),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return const EmptyBox();
                            }
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
