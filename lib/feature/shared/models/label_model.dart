import 'package:github_search_app/feature/explore_history/local/box/label_box.dart';
import 'package:github_search_app/feature/shared/response/label_response.dart';

class LabelModel {
  final String name;
  final String color;

  LabelModel({required this.name, required this.color});

  factory LabelModel.fromResponse(LabelResponse response) =>
      LabelModel(name: response.name, color: response.color);

  factory LabelModel.fromBox(LabelBox box) =>
      LabelModel(name: box.name, color: box.color);
}
