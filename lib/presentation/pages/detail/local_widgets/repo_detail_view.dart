part of '../detail_page.dart';

class _RepoDetailView
    extends BaseNoViewModelStateNotifierView<RepoDetailStateNotifier> {
  const _RepoDetailView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        /// BASIC INFO
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16) +
              const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ///  PROFILE IMAGE & OWNER NAME
              Row(
                children: [
                  ProfileImage(
                    imgUrl: snW(context).repoInfo.userProfileImgUrl,
                    size: 32,
                  ),
                  Gap.size8,
                  Text(
                    snW(context).repoInfo.userLoginName,
                    style: AppTextStyle.body2.copyWith(
                      color: AppColor.strongGrey,
                    ),
                  )
                ],
              ),

              Gap.size10,

              /// NAME
              Text(
                snW(context).repoInfo.title,
                style: AppTextStyle.headline2,
              ),

              Gap.size12,

              /// DESCRIPTION
              snW(context).repoInfo.description != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        snW(context).repoInfo.description ?? '',
                        style: AppTextStyle.title2,
                      ),
                    )
                  : const EmptyBox(),

              Gap.size4,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  /// STAR
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        AppAssets.starIcon,
                      ),
                      Gap.size6,
                      Text(
                        snW(context).repoInfo.starCount.getCommaSeparatedNum,
                        style: AppTextStyle.body2.copyWith(
                          color: AppColor.strongGrey,
                        ),
                      ),
                      Gap.size10,
                      SvgPicture.asset(AppAssets.forkIcon),
                      Gap.size6,
                      Text(
                        snW(context).repoInfo.forkCount.getCommaSeparatedNum,
                        style: AppTextStyle.body2.copyWith(
                          color: AppColor.strongGrey,
                        ),
                      ),
                    ],
                  ),

                  /// LANGUAGE
                  if (snW(context).repoInfo.language != null)
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: HexColor(
                              Language.getLanguageByName(
                                      snW(context).repoInfo.language!)
                                  .color,
                            ),
                          ),
                        ),
                        Gap.size6,
                        Text(
                          '${snW(context).repoInfo.language}',
                          style: AppTextStyle.body2.copyWith(
                            color: AppColor.strongGrey,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),

        /// READ ME
        Selector<RepoDetailStateNotifier, Ds<String>>(
          selector: (context, sn) => sn.readMeContent,
          builder: (context, readMeAsync, _) {
            return readMeAsync.onState(
              fetched: (readMe) {
                return Markdown(
                  data: readMe,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                );
              },
              failed: (e) {
                // 리드미가 없거나 삭제된 레포일 경우 빈박스를 리턴
                if (e is NetworkException &&
                    e.exceptionType == NetworkExceptionType.noResultFount) {
                  return const EmptyBox();
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 82),
                  child: Center(
                    child: ErrorIndicator(e),
                  ),
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.only(top: 82),
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  RepoDetailStateNotifier createStateNotifier(BuildContext context) =>
      locator<RepoDetailStateNotifier>();
}
