import 'package:json_annotation/json_annotation.dart';

part 'reactions_response.g.dart';

@JsonSerializable(createToJson: false)
class ReactionsResponse {
  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'total_count')
  int totalCount;

  @JsonKey(name: '+1')
  int plusOne;

  @JsonKey(name: '-1')
  int minusOne;

  @JsonKey(name: 'laugh')
  int laugh;

  @JsonKey(name: 'hooray')
  int hooray;

  @JsonKey(name: 'confused')
  int confused;

  @JsonKey(name: 'heart')
  int heart;

  @JsonKey(name: 'rocket')
  int rocket;

  @JsonKey(name: 'eyes')
  int eyes;

  ReactionsResponse(
    this.url,
    this.totalCount,
    this.plusOne,
    this.minusOne,
    this.laugh,
    this.hooray,
    this.confused,
    this.heart,
    this.rocket,
    this.eyes,
  );

  factory ReactionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ReactionsResponseFromJson(json);
}
