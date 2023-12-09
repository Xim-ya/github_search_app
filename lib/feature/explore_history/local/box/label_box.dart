import 'package:github_search_app/feature/shared/index.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'label_box.g.dart';

@HiveType(typeId: 6)
class LabelBox with HiveObjectMixin {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String color;

  LabelBox({required this.name, required this.color});

  factory LabelBox.fromModel(LabelModel model) =>
      LabelBox(name: model.color, color: model.color);
}
