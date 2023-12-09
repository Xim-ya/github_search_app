import 'package:github_search_app/feature/issue/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'searched_issue_response.g.dart';

@JsonSerializable(createToJson: false)
class SearchedIssueResponse {
  @JsonKey(name: 'total_count')
  int totalCount;

  @JsonKey(name: 'incomplete_results')
  bool incompleteResults;

  @JsonKey(name: 'items')
  List<IssueItemResponse> items;

  SearchedIssueResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  factory SearchedIssueResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchedIssueResponseFromJson(json);
}
