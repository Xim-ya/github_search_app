import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'github_element_category_box.g.dart';

@HiveType(typeId: 6)
class GithubElementCategoryBox extends HiveObject {
  @HiveField(0)
  final GithubElementCategory category;

  GithubElementCategoryBox(this.category);
}
