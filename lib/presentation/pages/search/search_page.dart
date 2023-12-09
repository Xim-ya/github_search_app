import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search_app/app/config/index.dart';
import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/pages/search/index.dart';

part 'local_widgets/search_app_bar.dart';
part 'local_widgets/search_indicator.dart';
part 'local_widgets/search_option_list_view.dart';
part 'local_widgets/search_page_scaffold.dart';

class SearchPage extends BasePage<SearchViewModel> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return const _Scaffold(
      searchIndicator: _SearchIndicator(),
      searchOptionList: _SearchOptionListView(),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => const _AppBar();

  @override
  bool get setBottomSafeArea => false;
}
