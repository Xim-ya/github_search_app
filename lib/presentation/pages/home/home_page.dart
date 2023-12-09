import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search_app/app/config/index.dart';
import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/helper/index.dart';
import 'package:github_search_app/app/modules/di/locator.dart';
import 'package:github_search_app/feature/explore_history/local/box/issue_box.dart';
import 'package:github_search_app/feature/explore_history/local/box/pr_box.dart';
import 'package:github_search_app/feature/explore_history/local/box/repo_box.dart';
import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:github_search_app/feature/user/index.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/common/index.dart';
import 'package:github_search_app/presentation/pages/home/index.dart';

part 'local_widgets/animated_app_bar.dart';
part 'local_widgets/collapsible_header.dart';
part 'local_widgets/explore_history_card_view.dart';
part 'local_widgets/favorite_user_card.dart';
part 'local_widgets/home_page_scaffold.dart';
part 'local_widgets/home_search_bar.dart';

class HomePage extends BasePage<HomeViewModel> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return const _Scaffold(
      searchBar: _SearchBar(),
      collapsibleHeader: _CollapsibleHeader(),
      animatedAppBar: _AnimatedAppBar(),
      favoriteUserCard: _FavoriteUserCard(),
      exploreHistoryCard: _ExploreHistoryCard(),
    );
  }

  @override
  bool get wrapWithSafeArea => false;
}
