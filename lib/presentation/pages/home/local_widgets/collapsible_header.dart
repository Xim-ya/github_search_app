part of '../home_page.dart';

class _CollapsibleHeader extends BaseView<HomeViewModel> {
  const _CollapsibleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      curve: Curves.easeInOut,
      top: vmW(context).isScrollToTopPosition ? 0 : -40,
      right: 0,
      left: 0,
      duration: const Duration(milliseconds: 230),
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        margin: EdgeInsets.only(bottom: 16, top: vm(context).headerTopInset),
        width: double.infinity,
        color: AppColor.lightBlue,
        child: Text(
          '홈',
          style: AppTextStyle.web3,
        ),
      ),
    );
  }
}
