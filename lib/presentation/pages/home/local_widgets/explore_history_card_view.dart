part of '../home_page.dart';

class _ExploreHistoryCard
    extends BaseNoViewModelStateNotifierView<ExploreHistoryStateNotifier>
    with HomeEvent {
  const _ExploreHistoryCard({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '탐색 항목',
          style: AppTextStyle.headline2,
        ),
        Gap.size8,
        snW(context).exploreHistories.onState(
            fetched: (histories) {
              return ShadowCard(
                child: Builder(
                  builder: (context) {
                    if (histories.isNotEmpty) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => SeparateDivider.thin(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        itemCount: histories.length,
                        itemBuilder: (context, index) {
                          final item = histories[index];
                          return GithubElementCategory.branch(
                              targetCategory:
                                  GithubElementCategory.getCategoryByTag(
                                      item.categoryTag),
                              user: (_) {
                                return UserListTile(
                                    item: UserBox.toModel(item as UserBox));
                              },
                              repository: (_) {
                                return RepositoryListTile(
                                  item: RepoBox.toModel(item as RepoBox),
                                );
                              },
                              issue: (_) => IssueListTile(
                                    item: IssueBox.toModel(item as IssueBox),
                                  ),
                              pr: (_) => PrListTile(
                                    item: PrBox.toModel(item as PrBox),
                                  ));
                        },
                      );
                    } else {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppAssets.exploreIndicator,
                              width: 230,
                            ),
                            Gap.size8,
                            Text(
                              '둘러본 항목, 한 번만 탭하면 이용 가능',
                              style: AppTextStyle.body2,
                            ),
                            Gap.size8,
                            Text(
                              '깃허브 콘텐츠를 확인하고 탐색 기록을 채워보세요!',
                              style: AppTextStyle.alert2,
                            ),
                            Gap.size18,
                            RoundedButton.outline(
                              text: '둘러보기',
                              onTap: () {
                                routeToSearch(context);
                              },
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              );
            },
            failed: (e) => ErrorIndicator(e),
            loading: () => const Text('loading'))
      ],
    );
  }

  @override
  ExploreHistoryStateNotifier createStateNotifier(BuildContext context) =>
      locator<ExploreHistoryStateNotifier>();
}
