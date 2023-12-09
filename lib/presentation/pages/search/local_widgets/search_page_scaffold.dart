part of '../search_page.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold(
      {Key? key, required this.searchIndicator, required this.searchOptionList})
      : super(key: key);

  final Widget searchIndicator;
  final Widget searchOptionList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        searchIndicator,
        Positioned(child: searchOptionList),
      ],
    );
  }
}
