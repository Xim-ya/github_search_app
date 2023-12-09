import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_search_app/app/config/index.dart';
import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/app/helper/index.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/common/index.dart';
import 'package:github_search_app/presentation/pages/detail/index.dart';
import 'package:provider/provider.dart';

part 'local_widgets/detail_page_app_bar.dart';
part 'local_widgets/issue_detail_view.dart';
part 'local_widgets/pr_detail_view.dart';
part 'local_widgets/repo_detail_view.dart';
part 'local_widgets/user_detail_view.dart';

class DetailPage extends BasePage<DetailViewModel> with DetailEvent {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return GithubElementCategory.branch(
      targetCategory: vm(context).selectedCategory,
      user: (_) => const _UserDetailView(),
      repository: (_) => const _RepoDetailView(),
      issue: (_) => const _IssueDetailView(),
      pr: (_) => const _PrDetailView(),
    );
  }

  @override
  bool get wrapWithSafeArea => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => BackButtonAppBar(
        title: '${vm(context).selectedCategory.name} 상세',
        actions: [
          if (vmW(context).isFavoriteBtnAvailable)
            ToggledStarButton(
              isFilled: vm(context).isUserSetToFavorite,
              onTap: () {
                onFavoriteBtnTapped(context);
              },
            )
        ],
      );
}
