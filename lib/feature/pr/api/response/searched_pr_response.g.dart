// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searched_pr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchedPrResponse _$SearchedPrResponseFromJson(Map<String, dynamic> json) =>
    SearchedPrResponse(
      totalCount: json['total_count'] as int,
      incompleteResults: json['incomplete_results'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => PrItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
