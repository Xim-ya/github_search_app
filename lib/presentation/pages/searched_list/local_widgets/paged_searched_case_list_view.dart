import 'package:flutter/material.dart';
import 'package:github_search_app/app/constant/enum/github_element_category.dart';

class PagedSearchedCaseListView extends StatelessWidget {
  const PagedSearchedCaseListView(
      {Key? key, required this.category, required this.onListTileTapped})
      : super(key: key);

  final GithubElementCategory category;
  final VoidCallback onListTileTapped;

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
