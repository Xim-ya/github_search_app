part of '../detail_page.dart';

class _PrDetailView
    extends BaseNoViewModelStateNotifierView<PrDetailStateNotifier> {
  const _PrDetailView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        PrListTile(
          item: sn(context).prInfo,
          ignoreTouchArea: true,
        ),
        Gap.size10,
        SeparateDivider.thick(AppColor.lightBlue),
        Gap.size16,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Wrap(
            direction: Axis.vertical,
            children: [
              /// SUGGESTER PROFILE
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ProfileImage(
                    imgUrl: sn(context).prInfo.suggesterProfileImg,
                    size: 46,
                  ),
                  Gap.size8,
                  SizedBox(
                    width: AppSize.to.screenWidth - 78,
                    child: Text(
                      sn(context).prInfo.suggesterLoginName,
                      style: AppTextStyle.headline4,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        // ISSUE CONTENT
        sn(context).issueContentExist
            ? Markdown(
                data: sn(context).prInfo.prContent!,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  '별도의 PR 본문 내용이 없습니다',
                  style: AppTextStyle.title2.copyWith(
                    color: AppColor.darkGrey,
                  ),
                ),
              )
      ],
    );
  }

  @override
  PrDetailStateNotifier createStateNotifier(BuildContext context) =>
      locator<PrDetailStateNotifier>();
}
