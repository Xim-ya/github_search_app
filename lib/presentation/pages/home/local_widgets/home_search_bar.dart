part of '../home_page.dart';

class _SearchBar extends BaseView<HomeViewModel> {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: vm(context).headerTopInset + vm(context).betweenHeaderInset),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 36,
      child: Hero(
        tag: 'search',
        child: CupertinoSearchTextField(
          focusNode: vmR(context).focusNode,
          placeholder: 'Search',
        ),
      ),
    );
  }
}
