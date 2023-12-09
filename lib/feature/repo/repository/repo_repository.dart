import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/repo/index.dart';

abstract interface class RepoRepository {
  /// 검색된 레포지터리 리스트 호출
  Future<Result<List<RepoBasicInfoModel>>> loadSearchedRepositories({
    required String query,
    required int perPage,
    required int page,
  });

  /// 검색된 레포지터리 컬렉션 결과 호출
  Future<Result<SearchedRepoCollectionModel>> loadSearchedRepositoryCollection({
    required String query,
    required int perPage,
    required int page,
  });

  /// 레포지토리 리드미 콘텐츠(md) 데이터 호출
  Future<Result<String>> loadReadMeContent({
    required String userLoginName,
    required String repoTitle,
  });
}
