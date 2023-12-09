import 'package:github_search_app/feature/shared/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'issue_item_response.g.dart';

@JsonSerializable(createToJson: false)
class IssueItemResponse {
  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'repository_url')
  String repositoryUrl;

  @JsonKey(name: 'labels_url')
  String labelsUrl;

  @JsonKey(name: 'comments_url')
  String commentsUrl;

  @JsonKey(name: 'events_url')
  String eventsUrl;

  @JsonKey(name: 'html_url')
  String htmlUrl;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'node_id')
  String nodeId;

  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'user')
  UserItemResponse user;

  @JsonKey(name: 'labels')
  List<LabelResponse> labels;

  @JsonKey(name: 'state')
  String state;

  @JsonKey(name: 'locked')
  bool locked;

  @JsonKey(name: 'assignee')
  UserItemResponse? assignee;

  @JsonKey(name: 'assignees')
  List<UserItemResponse> assignees;

  @JsonKey(name: 'comments')
  int comments;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'closed_at')
  String? closedAt;

  @JsonKey(name: 'author_association')
  String authorAssociation;

  @JsonKey(name: 'reactions')
  ReactionsResponse reactions;

  @JsonKey(name: 'timeline_url')
  String timelineUrl;

  @JsonKey(name: 'score')
  double score;

  @JsonKey(name: 'body')
  String? body;

  IssueItemResponse(
    this.url,
    this.repositoryUrl,
    this.labelsUrl,
    this.commentsUrl,
    this.eventsUrl,
    this.htmlUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.user,
    this.labels,
    this.state,
    this.locked,
    this.assignee,
    this.assignees,
    this.comments,
    this.createdAt,
    this.closedAt,
    this.authorAssociation,
    this.reactions,
    this.timelineUrl,
    this.score,
  );

  factory IssueItemResponse.fromJson(Map<String, dynamic> json) =>
      _$IssueItemResponseFromJson(json);
}
