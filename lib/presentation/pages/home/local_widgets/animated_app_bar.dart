part of '../home_page.dart';

class _AnimatedAppBar extends BaseView<HomeViewModel> {
  const _AnimatedAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: vmW(context).isScrollToTopPosition ? 0 : 1,
      duration: const Duration(milliseconds: 230),
      child: Container(
        height: 56,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.2, color: AppColor.grey,
              // color: AppColor.grey,
            ),
          ),
          color: AppColor.blurryWhite,
        ),
        child: Center(
          child: Text(
            '홈',
            style: AppTextStyle.headline4,
          ),
        ),
      ),
    );
  }
}
