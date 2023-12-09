part of '../home_page.dart';

class _Scaffold extends BaseView<HomeViewModel> {
  const _Scaffold({
    Key? key,
    required this.searchBar,
    required this.collapsibleHeader,
    required this.animatedAppBar,
    required this.favoriteUserCard,
    required this.exploreHistoryCard,
  }) : super(key: key);

  final Widget collapsibleHeader;
  final Widget searchBar;
  final Widget animatedAppBar;
  final Widget favoriteUserCard;
  final Widget exploreHistoryCard;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: vm(context).setMagneticPositionOnScroll,
      child: // LEADING HEADER
          AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        color: vmW(context).isScrollToTopPosition
            ? AppColor.lightBlue
            : AppColor.blurryWhite,
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              NestedScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: vmR(context).scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 52,
                        ),
                      ),
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                        sliver: SliverToBoxAdapter(
                          child: searchBar,
                        ),
                      ),
                    ];
                  },
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16) +
                          const EdgeInsets.only(bottom: 82),
                      child: Column(
                        children: <Widget>[
                          Gap.size20,
                          favoriteUserCard,
                          Gap.size24,
                          exploreHistoryCard,
                        ],
                      ),
                    ),
                  )),
              collapsibleHeader,
              animatedAppBar,
            ],
          ),
        ),
      ),
    );
  }
}
