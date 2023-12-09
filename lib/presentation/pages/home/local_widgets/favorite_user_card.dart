part of '../home_page.dart';

class _FavoriteUserCard
    extends BaseNoViewModelStateNotifierView<FavoriteFriendStateNotifier>
    with HomeEvent {
  const _FavoriteUserCard({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '즐겨찾는 유저',
          style: AppTextStyle.headline2,
        ),
        Gap.size8,
        snW(context).favoriteUserList.onState(
              fetched: (users) {
                if (users.isNotEmpty) {
                  return ShadowCard(
                    child: Column(
                      children: [
                        // FAVORITE USER LIST
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            shrinkWrap: true,
                            itemCount: users.length > 3 ? 3 : users.length,
                            itemBuilder: (context, index) {
                              return _buildFavoriteUserItem(users, index);
                            }),

                        /// MORE BUTTON
                        if (users.length > 3) _buildMoreButton(users, context),
                      ],
                    ),
                  );
                } else {
                  return _buildNoUserFoundView();
                }
              },
              failed: (e) => ErrorIndicator(e),
              loading: () => const Center(
                child: EmptyBox(),
              ),
            )
      ],
    );
  }

  ///
  /// 즐겨찾기에 등록된 유저가 없을 때 보여지는 뷰
  ///
  Container _buildNoUserFoundView() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            AppAssets.noUserIndicator,
          ),
          Gap.size6,
          Text(
            '즐겨찾기에 등록된 유저가 아직 없어요!',
            style: AppTextStyle.body3.copyWith(color: AppColor.darkGrey),
          )
        ],
      ),
    );
  }

  ///
  /// 더 보기 버튼
  ///
  Padding _buildMoreButton(List<UserBox> users, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16) +
          const EdgeInsets.only(bottom: 20, top: 8),
      child: RoundedButton.filled(
        text: '${users.length}개 더 보기',
        onTap: () {
          routeToFavoriteUsers(context);
        },
      ),
    );
  }

  ///
  /// 즐겨찾기 유저 List item
  ///
  HookBuilder _buildFavoriteUserItem(List<UserBox> users, int index) {
    final item = users[index];
    return HookBuilder(
      builder: (BuildContext context) {
        final isOpen = useState(false);
        return FlexibleExpansionTile(
          onTap: () {},
          isExpanded: isOpen,
          title: Stack(
            children: [
              Positioned(
                right: 16,
                top: 0,
                bottom: 0,
                child: AnimatedRotation(
                  turns: isOpen.value ? 0 : 0.5,
                  duration: const Duration(milliseconds: 240),
                  child: SvgPicture.asset(
                    AppAssets.arrowDown,
                  ),
                ),
              ),
              UserListTile(
                width: AppSize.to.screenWidth - 32,
                ignoreTouchArea: true,
                item: UserBasicInfoModel(
                  loginName: item.loginName,
                  nodeId: item.nodeId,
                  profileImgUrl: item.profileImgUrl,
                ),
              ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /// BIO
                  Builder(builder: (context) {
                    if (item.bio != null) {
                      return Text(
                        item.bio!,
                        style: AppTextStyle.body2,
                        textAlign: TextAlign.start,
                      );
                    } else {
                      return const EmptyBox();
                    }
                  }),

                  /// LOCATION
                  Builder(builder: (context) {
                    if (item.location != null) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: <Widget>[
                            SvgPicture.asset(
                              AppAssets.locationIcon,
                              colorFilter: const ColorFilter.mode(
                                AppColor.labeledGrey,
                                BlendMode.srcIn,
                              ),
                            ),
                            Gap.size4,
                            Text(
                              item.location!,
                              style: AppTextStyle.body2.copyWith(
                                color: AppColor.darkGrey,
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return const EmptyBox();
                    }
                  }),

                  /// FOLLOWERS & FOLLOWING
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        AppAssets.userIcon,
                        width: 16,
                        colorFilter: const ColorFilter.mode(
                          AppColor.labeledGrey,
                          BlendMode.srcIn,
                        ),
                      ),
                      Gap.size4,
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: item.followersCount.getKMBFFormat,
                              style: AppTextStyle.body3,
                            ),
                            TextSpan(
                              text: ' 팔로워',
                              style: AppTextStyle.body3
                                  .copyWith(color: AppColor.labeledGrey),
                            ),
                            TextSpan(text: ' · ', style: AppTextStyle.body3),
                            TextSpan(
                              text: item.followingCount.getKMBFFormat,
                              style: AppTextStyle.body3,
                            ),
                            TextSpan(
                              text: ' 팔로우',
                              style: AppTextStyle.body3
                                  .copyWith(color: AppColor.labeledGrey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  Gap.size10,
                  RoundedButton.outline(
                    text: '상세페이지로 이동',
                    onTap: () {
                      routeToUserDetail(context, item.loginName);
                    },
                  ),
                  Gap.size8,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  FavoriteFriendStateNotifier createStateNotifier(BuildContext context) =>
      locator<FavoriteFriendStateNotifier>();
}
