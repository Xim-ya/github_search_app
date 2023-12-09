import 'package:json_annotation/json_annotation.dart';

part 'label_response.g.dart';

@JsonSerializable(createToJson: false)
class LabelResponse {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'node_id')
  String nodeId;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'color')
  String color;

  @JsonKey(name: 'default')
  bool defaultLabel;

  @JsonKey(name: 'description')
  String? description;

  LabelResponse(
    this.id,
    this.nodeId,
    this.url,
    this.name,
    this.color,
    this.defaultLabel,
    this.description,
  );

  factory LabelResponse.fromJson(Map<String, dynamic> json) =>
      _$LabelResponseFromJson(json);
}
