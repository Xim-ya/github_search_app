import 'package:github_search_app/app/constant/index.dart';

///
/// 깃허브 카테고리 (검색 카티고리)
///

enum GithubElementCategory {
  user('user', AppAssets.userIcon, '유저', '이(가) 이름에 포함된 사람'),
  repository('repo', AppAssets.repoIcon, '리포지토리', '이(가) 포함된 리포지토리'),
  issue('issue', AppAssets.issueIcon, 'Issue', '이(가) 포함된 Issue'),
  pr('pr', AppAssets.prOpen, 'Pull Request', '이(가) 포함된 Pul Request'),
  total('total', AppAssets.longArrowRightIcon, '통합', '통합검색');

  final String tag;
  final String iconPath;
  final String name;
  final String searchDescription;

  ///
  /// [total] enum 값을 제외한 나머지 enum값을 리턴
  ///
  static List<GithubElementCategory> get getValuesExceptTotal {
    List<GithubElementCategory> categories =
        List.from(GithubElementCategory.values);
    categories.remove(GithubElementCategory.total);

    return categories;
  }

  ///
  /// Enum 상태에 따라 위젯을 분기할 수 있게 도와주는 메소드
  ///
  static R branchAll<R>({
    required GithubElementCategory targetCategory,
    required R Function(GithubElementCategory) user,
    required R Function(GithubElementCategory) repository,
    required R Function(GithubElementCategory) issue,
    required R Function(GithubElementCategory) pr,
    required R Function(GithubElementCategory) total,
  }) {
    switch (targetCategory) {
      case GithubElementCategory.user:
        return user(targetCategory);
      case GithubElementCategory.repository:
        return repository(targetCategory);
      case GithubElementCategory.issue:
        return issue(targetCategory);
      case GithubElementCategory.pr:
        return pr(targetCategory);
      case GithubElementCategory.total:
        return total(targetCategory);
      default:
        throw Exception('잘못된 카테고리입니다: $targetCategory');
    }
  }

  static R branch<R>({
    required GithubElementCategory targetCategory,
    required R Function(GithubElementCategory) user,
    required R Function(GithubElementCategory) repository,
    required R Function(GithubElementCategory) issue,
    required R Function(GithubElementCategory) pr,
  }) {
    switch (targetCategory) {
      case GithubElementCategory.user:
        return user(targetCategory);
      case GithubElementCategory.repository:
        return repository(targetCategory);
      case GithubElementCategory.issue:
        return issue(targetCategory);
      case GithubElementCategory.pr:
        return pr(targetCategory);

      default:
        throw Exception('잘못된 카테고리입니다: $targetCategory');
    }
  }

  const GithubElementCategory(
    this.tag,
    this.iconPath,
    this.name,
    this.searchDescription,
  );

  static GithubElementCategory getCategoryByTag(String tag) {
    return values.firstWhere(
      (category) => category.tag == tag,
      orElse: () => throw Exception('잘못된 반환값'),
    );
  }

  bool get isTotal => this == GithubElementCategory.total;
}
