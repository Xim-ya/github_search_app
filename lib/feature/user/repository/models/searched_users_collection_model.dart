import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/feature/shared/index.dart';
import 'package:github_search_app/feature/user/index.dart';

class SearchedUserCollectionModel
    extends GithubDataCollectionModel<UserBasicInfoModel> {
  SearchedUserCollectionModel({
    required super.totalCount,
    required super.basicInfoItems,
    required super.category,
  });

  factory SearchedUserCollectionModel.fromResponse(
      UserSearchResponse response) {
    return SearchedUserCollectionModel(
      totalCount: response.totalCount,
      category: GithubElementCategory.user,
      basicInfoItems: response.items
          .map(
            (e) => UserBasicInfoModel.fromResponse(e),
          )
          .toList(),
    );
  }
}
