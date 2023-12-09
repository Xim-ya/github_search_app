import 'package:github_search_app/app/constant/enum/github_element_category.dart';

abstract class GithubDataCollectionModel<T> {
  final int totalCount; // 총 불러올 수 있는 데이터 개수
  final GithubElementCategory category; // 카테고리
  final List<T> basicInfoItems; // 데이터 리스트 (기본)

  GithubDataCollectionModel({
    required this.totalCount,
    required this.category,
    required this.basicInfoItems,
  });
}
