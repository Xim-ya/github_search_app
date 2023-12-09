// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_issue_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedIssueResponse _$SearchedIssueResponseFromJson(
        Map<String, dynamic> json) =>
    SearchedIssueResponse(
      totalCount: json['total_count'] as int,
      incompleteResults: json['incomplete_results'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => IssueItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
