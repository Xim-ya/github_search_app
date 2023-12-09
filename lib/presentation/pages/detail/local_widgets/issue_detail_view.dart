part of '../detail_page.dart';

class _IssueDetailView
    extends BaseNoViewModelStateNotifierView<IssueDetailStateNotifier> {
  const _IssueDetailView({Key? key}) : super(key: key);

  @override
  Widget buildView(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: <Widget>[
        /// ISSUE BASIC INFO
        IssueListTile(
          item: sn(context).issueInfo,
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
                    imgUrl: sn(context).issueInfo.suggesterProfileImg,
                    size: 46,
                  ),
                  Gap.size8,
                  SizedBox(
                    width: AppSize.to.screenWidth - 78,
                    child: Text(
                      sn(context).issueInfo.suggesterLoginName,
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
                data: sn(context).issueInfo.issueContent!,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  '별도의 이슈 본문 내용이 없습니다',
                  style: AppTextStyle.title2.copyWith(
                    color: AppColor.darkGrey,
                  ),
                ),
              )
      ],
    );
  }

  @override
  IssueDetailStateNotifier createStateNotifier(BuildContext context) =>
      locator<IssueDetailStateNotifier>();
}
