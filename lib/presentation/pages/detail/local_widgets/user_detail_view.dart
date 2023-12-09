part of '../detail_page.dart';

class _UserDetailView
    extends BaseStateNotifierView<DetailViewModel, UserDetailStateNotifier> {
  const _UserDetailView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return snW(context).userDetailInfo.onState(
          fetched: (userInfo) {
            return ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: <Widget>[
                Gap.size16,
                Row(
                  children: <Widget>[
                    /// PROFILE IMG
                    ProfileImage(imgUrl: userInfo.profileImgUrl, size: 66),

                    Gap.size14,

                    Wrap(
                      direction: Axis.vertical,
                      children: <Widget>[
                        /// LOGIN NAME
                        Text(
                          userInfo.loginName,
                          style: AppTextStyle.headline4,
                        ),

                        /// NAME
                        Builder(
                          builder: (context) {
                            if (userInfo.name != null) {
                              return Text(
                                userInfo.name!,
                                style: AppTextStyle.title2.copyWith(
                                  color: AppColor.darkGrey,
                                ),
                              );
                            } else {
                              return const EmptyBox();
                            }
                          },
                        )
                      ],
                    ),
                  ],
                ),

                /// BIO
                Builder(builder: (context) {
                  if (userInfo.bio != null) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Text(
                        userInfo.bio!,
                        style: AppTextStyle.body2,
                      ),
                    );
                  } else {
                    return const EmptyBox();
                  }
                }),

                /// LOCATION
                Builder(builder: (context) {
                  if (userInfo.location != null) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            AppAssets.locationIcon,
                          ),
                          Gap.size4,
                          Text(
                            userInfo.location!,
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

                Gap.size16,

                /// CREATED AT
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.calendarIcon,
                    ),
                    Gap.size4,
                    Text(
                      '${userInfo.createdAt.dateToyyyyMd}에 가입',
                      style: AppTextStyle.body2.copyWith(
                        color: AppColor.darkGrey,
                      ),
                    )
                  ],
                ),

                Gap.size34,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(UserMetric.values.length, (index) {
                      final item = UserMetric.values[index];

                      return SizedBox(
                        width: (AppSize.to.screenWidth - 72) / 3,
                        child: ShadowCard(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Column(
                            children: <Widget>[
                              SvgPicture.asset(
                                item.icon,
                                colorFilter: const ColorFilter.mode(
                                  AppColor.labeledGrey,
                                  BlendMode.srcIn,
                                ),
                              ),
                              Gap.size6,
                              Text(
                                vm(context)
                                    .getCountByMetricInfo(item)
                                    .getKMBFFormat,
                                style: AppTextStyle.web3.copyWith(fontSize: 28),
                                textAlign: TextAlign.center,
                              ),
                              Gap.size8,
                              Text(
                                item.text,
                                style: AppTextStyle.alert2.copyWith(
                                  color: AppColor.labeledGrey,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })
                  ],
                ),
              ],
            );
          },
          failed: (e) => Center(
            child: ErrorIndicator(e),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
  }

  @override
  UserDetailStateNotifier createStateNotifier(BuildContext context) =>
      locator<UserDetailStateNotifier>();
}
