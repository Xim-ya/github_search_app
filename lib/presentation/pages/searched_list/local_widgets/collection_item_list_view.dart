part of 'total_collection_list_view.dart';

class _CollectionItemListView extends BaseView<SearchedListViewModel>
    with SearchedListEvent {
  const _CollectionItemListView(
      {Key? key, required this.selectedCategory, required this.collection})
      : super(key: key);

  final GithubElementCategory selectedCategory;
  final GithubDataCollectionModel collection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16) +
          const EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // TITLE
          Text(
            selectedCategory.name,
            style: AppTextStyle.headline3,
          ),
          Gap.size12,

          ShadowCard(
            child: Column(
              children: [
                // ITEM LIST
                Builder(builder: (context) {
                  /// 반환된 아이템이 0개가 아니라면
                  /// 리스트뷰를 리턴
                  if (collection.basicInfoItems.isNotEmpty) {
                    return ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (_, __) => SeparateDivider.thin(),
                      itemCount: collection.basicInfoItems.length,
                      itemBuilder: (context, index) {
                        final responsiveBorderRadius =
                            vm(context).getBorderRadiusByIndex(
                          index: index,
                          itemCount: collection.basicInfoItems.length,
                        );

                        return GithubElementCategory.branch(
                          targetCategory: collection.category,
                          user: (_) => UserListTile(
                            item: collection.basicInfoItems[index]
                                as UserBasicInfoModel,
                            borderRadius: responsiveBorderRadius,
                          ),
                          repository: (_) => RepositoryListTile(
                            item: collection.basicInfoItems[index]
                                as RepoBasicInfoModel,
                            borderRadius: responsiveBorderRadius,
                          ),
                          issue: (_) => IssueListTile(
                            item: collection.basicInfoItems[index]
                                as IssueBasicInfoModel,
                            borderRadius: responsiveBorderRadius,
                          ),
                          pr: (_) => PrListTile(
                            item: collection.basicInfoItems[index]
                                as PrBasicInfoModel,
                            borderRadius: responsiveBorderRadius,
                          ),
                        );
                      },
                    );
                  } else {
                    /// 반환된 아이템이 없다면 (0개라면)
                    /// 검색 결과가 없닫는 인디케이터 리턴
                    return Container(
                      margin: const EdgeInsets.all(40),
                      child: Center(
                        child: Column(
                          children: [
                            SvgPicture.asset(AppAssets.noResultIndicator),
                            Gap.size16,
                            Text(
                              '검색된 ${selectedCategory.name}가 없어요',
                              style: AppTextStyle.title3.copyWith(
                                color: AppColor.darkGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                }),

                // SHOW MORE BUTTON
                Builder(
                  builder: (context) {
                    /// 반환된 데이터가 없거나
                    /// 3개 이하일 경우 '더보기' 버튼을 노출하지 않음
                    if (collection.totalCount <= 3) {
                      return const EmptyBox();
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16) +
                          const EdgeInsets.only(bottom: 20, top: 8),
                      child: RoundedButton.filled(
                        text: '${collection.totalCount}개 더 보기',
                        onTap: () {
                          routeToTotalSearchedResult(
                            context,
                            selectedCategory: selectedCategory,
                            keyword: vm(context).routeArg.keyword,
                            totalCount: collection.totalCount,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
