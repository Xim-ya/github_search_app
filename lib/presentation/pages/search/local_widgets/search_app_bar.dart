part of '../search_page.dart';

class _AppBar extends BaseView<SearchViewModel>
    with SearchEvent
    implements PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.2, color: AppColor.grey,
              // color: AppColor.grey,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Hero(
              tag: "search",
              flightShuttleBuilder: ((flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                animation.addStatusListener(
                  (status) {
                    if (status == AnimationStatus.completed) {
                      // Hero 애니메이션 끝나고 focus 활성화
                      vm(context).setFocusPosition();
                    }
                  },
                );

                /// Hero 애니메이션 끝나기 전 까지
                /// PlaceHolder로 보여질 뷰
                /// Hero fade-out 애니메이션을 자연스럽게하기 위해
                /// margin 속성을 조건에따라 제거함
                return Container(
                  margin: vmW(context).isTextFieldMounted
                      ? null
                      : const EdgeInsets.only(left: 16),
                  height: 36,
                  width: AppSize.to.screenWidth,
                  child: const CupertinoSearchTextField(
                    placeholder: 'Search',
                  ),
                );
              }),
              child: Container(
                margin: const EdgeInsets.only(left: 16),
                height: 36,
                width: AppSize.to.screenWidth - 72,
                child: CupertinoSearchTextField(
                  onChanged: (text) {
                    onInputChanged(context, input: text);
                  },
                  onSubmitted: (_) {
                    onSearchOptionTapped(
                      context,
                      selectedCategory: GithubElementCategory.total,
                      keyword: vm(context).textEditingController.text,
                    );
                  },
                  autofocus: true,
                  focusNode: vm(context).focusNode,
                  controller: vm(context).textEditingController,
                  placeholder: 'Search',
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                child: Text(
                  '취소',
                  style: AppTextStyle.title2.copyWith(
                    color: AppColor.blue,
                  ),
                ),
                onPressed: () {
                  onCancelBtnTapped(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(62);
}
