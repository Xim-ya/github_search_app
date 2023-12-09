import 'package:github_search_app/feature/shared/response/user_item_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_search_response.g.dart';

@JsonSerializable()
class UserSearchResponse {
  @JsonKey(name: 'total_count')
  int totalCount;

  @JsonKey(name: 'incomplete_results')
  bool incompleteResults;

  @JsonKey(name: 'items')
  List<UserItemResponse> items;

  UserSearchResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  factory UserSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSearchResponseFromJson(json);
}
