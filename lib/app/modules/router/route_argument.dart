import 'package:github_search_app/app/constant/enum/github_element_category.dart';

///
/// 라우팅 인자값 타입을 정의
///

/// [SearchPage] -> [SearchedListPage]
typedef SearchedListPageRouteArg = ({
  GithubElementCategory selectedCategory,
  String keyword
});

/// [SearchedListPage]&[TotalSearchedListPage]*[HomePage] -> [DetailPage]
typedef DetailPageRouteArg = ({
  GithubElementCategory selectedCategory,
  dynamic extra,
});
