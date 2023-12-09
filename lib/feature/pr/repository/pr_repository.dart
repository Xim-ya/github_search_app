import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/pr/index.dart';

abstract class PrRepository {
  /// 검색된 PR 리스트 호출
  Future<Result<List<PrBasicInfoModel>>> loadSearchedPrList({
    required String query,
    required int perPage,
    required int page,
  });

  /// 검색된 PR 컬렉션 호출
  Future<Result<SearchedPrCollectionModel>> loadSearchedPrCollection({
    required String query,
    required int perPage,
    required int page,
  });
}
