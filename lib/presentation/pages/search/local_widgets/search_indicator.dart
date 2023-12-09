part of '../search_page.dart';

class _SearchIndicator extends BaseView<SearchViewModel> {
  const _SearchIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 180),
      opacity: vmW(context).isInputFilled ? 0 : 1.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '무엇이든 찾아보세요',
              style: AppTextStyle.headline2,
            ),
            Gap.size10,
            Text(
              '모든 GitHub에서 사용자, 리포지토리, 조직, Issue 및 Pull Reuqest를 검색합니다.',
              style: AppTextStyle.body2.copyWith(color: AppColor.darkGrey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
