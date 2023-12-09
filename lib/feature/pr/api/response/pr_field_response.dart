import 'package:json_annotation/json_annotation.dart';

part 'pr_field_response.g.dart';

@JsonSerializable(createToJson: false)
class PrFieldResponse {
  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'html_url')
  String htmlUrl;

  @JsonKey(name: 'diff_url')
  String diffUrl;

  @JsonKey(name: 'patch_url')
  String patchUrl;

  @JsonKey(name: 'merged_at')
  String? mergedAt;

  PrFieldResponse(
      this.url, this.htmlUrl, this.diffUrl, this.patchUrl, this.mergedAt);

  factory PrFieldResponse.fromJson(Map<String, dynamic> json) =>
      _$PrFieldResponseFromJson(json);
}
