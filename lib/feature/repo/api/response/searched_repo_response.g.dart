// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_repo_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedRepoResponse _$SearchedRepoResponseFromJson(
        Map<String, dynamic> json) =>
    SearchedRepoResponse(
      totalCount: json['total_count'] as int,
      incompleteResults: json['incomplete_results'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => RepoItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchedRepoResponseToJson(
        SearchedRepoResponse instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'incomplete_results': instance.incompleteResults,
      'items': instance.items,
    };
