import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/feature/pr/index.dart';
import 'package:github_search_app/feature/shared/index.dart';

class SearchedPrCollectionModel
    extends GithubDataCollectionModel<PrBasicInfoModel> {
  SearchedPrCollectionModel(
      {required super.totalCount,
      required super.category,
      required super.basicInfoItems});

  factory SearchedPrCollectionModel.fromResponse(SearchedPrResponse response) =>
      SearchedPrCollectionModel(
        totalCount: response.totalCount,
        category: GithubElementCategory.pr,
        basicInfoItems: response.items
            .map((e) => PrBasicInfoModel.fromResponse(e))
            .toList(),
      );
}
