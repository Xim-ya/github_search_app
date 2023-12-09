import 'package:github_search_app/feature/pr/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'searched_pr_response.g.dart';

@JsonSerializable(createToJson: false)
class SearchedPrResponse {
  @JsonKey(name: 'total_count')
  int totalCount;

  @JsonKey(name: 'incomplete_results')
  bool incompleteResults;

  @JsonKey(name: 'items')
  List<PrItemResponse> items;

  SearchedPrResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  factory SearchedPrResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchedPrResponseFromJson(json);
}
