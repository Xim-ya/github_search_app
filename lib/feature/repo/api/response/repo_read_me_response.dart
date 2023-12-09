import 'package:json_annotation/json_annotation.dart';

part 'repo_read_me_response.g.dart';

@JsonSerializable(createToJson: false)
class RepoReadMeResponse {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'path')
  String? path;

  @JsonKey(name: 'sha')
  String sha;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'html_url')
  String htmlUrl;

  @JsonKey(name: 'git_url')
  String gitUrl;

  @JsonKey(name: 'download_url')
  String downloadUrl;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'encoding')
  String encoding;

  RepoReadMeResponse(
    this.name,
    this.path,
    this.sha,
    this.size,
    this.url,
    this.htmlUrl,
    this.gitUrl,
    this.downloadUrl,
    this.type,
    this.content,
    this.encoding,
  );

  factory RepoReadMeResponse.fromJson(Map<String, dynamic> json) =>
      _$RepoReadMeResponseFromJson(json);
}
