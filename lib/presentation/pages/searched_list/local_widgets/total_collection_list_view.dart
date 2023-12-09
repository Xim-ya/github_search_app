import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search_app/app/config/index.dart';
import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/modules/di/locator.dart';
import 'package:github_search_app/feature/issue/index.dart';
import 'package:github_search_app/feature/pr/index.dart';
import 'package:github_search_app/feature/repo/index.dart';
import 'package:github_search_app/feature/shared/index.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/common/button/rounded_button.dart';
import 'package:github_search_app/presentation/common/index.dart';
import 'package:github_search_app/presentation/pages/searched_list/index.dart';

part 'collection_item_list_view.dart';

class TotalCollectionListView extends BaseStateNotifierView<
    SearchedListViewModel, SearchedTotalStateNotifier> with SearchedListEvent {
  const TotalCollectionListView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    if (snW(context).loaded) {
      return ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(bottom: 72),
          separatorBuilder: (_, __) => Gap.size36,
          itemCount: GithubElementCategory.getValuesExceptTotal.length,
          itemBuilder: (context, index) {
            final selectedCategory =
                GithubElementCategory.getValuesExceptTotal[index];

            final collectionAsync =
                sn(context).collectionMap[selectedCategory]!;

            return collectionAsync.onState(
              fetched: (collection) {
                return _CollectionItemListView(
                    selectedCategory: selectedCategory, collection: collection);
              },
              failed: (e) => _buildFailedCardView(selectedCategory, e),
              loading: () => const EmptyBox(),
            );
          });
    } else {
      // LOADING
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    }
  }

  ///
  /// 실패시 보여지는 카드 뷰
  ///
  _buildFailedCardView(GithubElementCategory category, Object e) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16) +
          const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLE
          Text(
            category.name,
            style: AppTextStyle.headline3,
          ),
          Gap.size12,
          ShadowCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: ErrorIndicator(e),
          ),
        ],
      ),
    );
  }

  @override
  SearchedTotalStateNotifier createStateNotifier(BuildContext context) =>
      locator<SearchedTotalStateNotifier>();
}
