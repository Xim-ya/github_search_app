import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search_app/app/config/app_color.dart';
import 'package:github_search_app/app/config/app_gap.dart';
import 'package:github_search_app/app/config/app_text_style.dart';
import 'package:github_search_app/app/constant/app_assets.dart';
import 'package:github_search_app/app/helper/extension/go_router_extension.dart';
import 'package:github_search_app/app/modules/router/app_pages.dart';
import 'package:github_search_app/presentation/common/box/empty_box.dart';
import 'package:github_search_app/presentation/common/indicator/error_indicator.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

///
/// [PagedListView]를 모듈화한 위젯
/// 여러 예외처리 로직을 담고 있음
///

class ResponsivePagedListView<T> extends StatelessWidget {
  const ResponsivePagedListView({
    Key? key,
    required this.pagingController,
    required this.itemBuilder,
    this.listItemLoadingView,
    this.separateView,
    this.scrollController,
    this.physics,
  }) : super(key: key);

  final Widget? listItemLoadingView;
  final Widget? separateView;
  final PagingController<int, T> pagingController;
  final ItemWidgetBuilder<T> itemBuilder;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, T>.separated(
      physics: physics,
      scrollController: scrollController,
      pagingController: pagingController,
      separatorBuilder: (__, _) => separateView ?? const EmptyBox(),
      builderDelegate: PagedChildBuilderDelegate<T>(
        animateTransitions: true,

        /* 다음 페이지 리스트 불러올 때 로딩 Indicator */
        newPageProgressIndicatorBuilder: (context) => const Center(
          child: SizedBox(
            height: 68,
            child: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ),

        /* 페이징된 결과가 없을 때 */
        noItemsFoundIndicatorBuilder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.noResultIndicator),
              Gap.size16,
              Text(
                '검색된 결과가 없어요',
                style: AppTextStyle.title3.copyWith(
                  color: AppColor.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        newPageErrorIndicatorBuilder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ErrorIndicator(pagingController.error),
                Gap.size6,
                TextButton(
                  onPressed: () {
                    context.popUntil(AppPages.home);
                  },
                  child: Text(
                    '홈으로 이동하기',
                    style: AppTextStyle.alert2.copyWith(color: AppColor.blue),
                  ),
                )
              ],
            ),
          );
        },

        /* 에러 */
        firstPageErrorIndicatorBuilder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ErrorIndicator(pagingController.error),
                Gap.size6,
                TextButton(
                  onPressed: () {
                    context.popUntil(AppPages.home);
                  },
                  child: Text(
                    '홈으로 이동하기',
                    style: AppTextStyle.alert2.copyWith(color: AppColor.blue),
                  ),
                )
              ],
            ),
          );
        },

        /* 초기 로딩 인디케이터 */
        firstPageProgressIndicatorBuilder: (context) {
          if (listItemLoadingView != null) {
            return Column(
              children: [
                ...List.generate(
                  6,
                  (index) => Column(
                    children: [
                      listItemLoadingView!,
                      Divider(),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },

        /* 페이징 결과*/
        itemBuilder: itemBuilder,
      ),
    );
  }
}
