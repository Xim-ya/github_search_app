import 'package:github_search_app/feature/repo/api/response/repo_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'searched_repo_response.g.dart';

@JsonSerializable()
class SearchedRepoResponse {
  @JsonKey(name: 'total_count')
  int totalCount;

  @JsonKey(name: 'incomplete_results')
  bool incompleteResults;

  @JsonKey(name: 'items')
  List<RepoItemResponse> items;

  SearchedRepoResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  factory SearchedRepoResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchedRepoResponseFromJson(json);
}
