// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueItemResponse _$IssueItemResponseFromJson(Map<String, dynamic> json) =>
    IssueItemResponse(
      json['url'] as String,
      json['repository_url'] as String,
      json['labels_url'] as String,
      json['comments_url'] as String,
      json['events_url'] as String,
      json['html_url'] as String,
      json['id'] as int,
      json['node_id'] as String,
      json['number'] as int,
      json['title'] as String,
      UserItemResponse.fromJson(json['user'] as Map<String, dynamic>),
      (json['labels'] as List<dynamic>)
          .map((e) => LabelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['state'] as String,
      json['locked'] as bool,
      json['assignee'] == null
          ? null
          : UserItemResponse.fromJson(json['assignee'] as Map<String, dynamic>),
      (json['assignees'] as List<dynamic>)
          .map((e) => UserItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['comments'] as int,
      json['created_at'] as String,
      json['closed_at'] as String?,
      json['author_association'] as String,
      ReactionsResponse.fromJson(json['reactions'] as Map<String, dynamic>),
      json['timeline_url'] as String,
      (json['score'] as num).toDouble(),
    )..body = json['body'] as String?;
