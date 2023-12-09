import 'package:json_annotation/json_annotation.dart';

part 'repo_license_response.g.dart';

@JsonSerializable()
class RepoLicenseResponse {
  @JsonKey(name: 'key')
  final String key;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'spdx_id')
  final String spdxId;
  @JsonKey(name: 'node_id')
  final String nodeId;

  RepoLicenseResponse({
    required this.key,
    required this.name,
    required this.url,
    required this.spdxId,
    required this.nodeId,
  });

  factory RepoLicenseResponse.fromJson(Map<String, dynamic> json) =>
      _$RepoLicenseResponseFromJson(json);
}
