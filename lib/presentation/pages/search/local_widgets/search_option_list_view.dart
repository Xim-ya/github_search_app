part of '../search_page.dart';

class _SearchOptionListView extends BaseView<SearchViewModel> with SearchEvent {
  const _SearchOptionListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ...List.generate(GithubElementCategory.values.length, (index) {
          final option = GithubElementCategory.values[index];
          return AnimatedPositioned(
            top: vmW(context).isInputFilled
                ? index * 56
                : vm(context).getSpreadTilePosition(index),
            right: 0,
            left: 0,
            duration: const Duration(milliseconds: 220),
            child: AnimatedOpacity(
              opacity: vmW(context).isInputFilled ? 1 : 0,
              duration: const Duration(milliseconds: 340),
              child: IgnorePointer(
                ignoring: vm(context).isInputFilled ? false : true,
                child: InkWell(
                  onTap: () {
                    onSearchOptionTapped(
                      context,
                      selectedCategory: option,
                      keyword: vm(context).textEditingController.text,
                    );
                  },
                  child: SizedBox(
                    height: 56,
                    child: ListTile(
                      leading: SvgPicture.asset(
                        option.iconPath,
                        colorFilter: const ColorFilter.mode(
                          AppColor.lightDarkGrey,
                          BlendMode.srcIn,
                        ),
                      ),
                      title: Builder(
                        builder: (context) {
                          return Text(
                            option.isTotal
                                ? '통합 검색'
                                : '"${vm(context).textEditingController.text}\"${option.searchDescription}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          );
                        },
                      ),
                      trailing: SvgPicture.asset(
                        AppAssets.arrowRightIcon,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
