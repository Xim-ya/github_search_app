import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/feature/repo/index.dart';
import 'package:github_search_app/feature/shared/index.dart';

class SearchedRepoCollectionModel
    extends GithubDataCollectionModel<RepoBasicInfoModel> {
  SearchedRepoCollectionModel(
      {required super.totalCount,
      required super.category,
      required super.basicInfoItems});

  factory SearchedRepoCollectionModel.fromResponse(
          SearchedRepoResponse response) =>
      SearchedRepoCollectionModel(
          totalCount: response.totalCount,
          category: GithubElementCategory.repository,
          basicInfoItems: response.items
              .map((e) => RepoBasicInfoModel.fromResponse(e))
              .toList());
}
