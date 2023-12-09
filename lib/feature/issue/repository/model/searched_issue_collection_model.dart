import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/feature/issue/api/response/searched_issue_response.dart';
import 'package:github_search_app/feature/issue/repository/model/issue_basic_info_model.dart';
import 'package:github_search_app/feature/shared/models/github_data_collection_model.dart';

class SearchedIssueCollectionModel
    extends GithubDataCollectionModel<IssueBasicInfoModel> {
  SearchedIssueCollectionModel({
    required super.totalCount,
    required super.category,
    required super.basicInfoItems,
  });

  factory SearchedIssueCollectionModel.fromResponse(
          SearchedIssueResponse response) =>
      SearchedIssueCollectionModel(
          totalCount: response.totalCount,
          category: GithubElementCategory.issue,
          basicInfoItems: response.items
              .map((e) => IssueBasicInfoModel.fromResponse(e))
              .toList());
}
