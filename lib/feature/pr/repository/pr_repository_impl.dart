import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/pr/index.dart';

class PrRepositoryImpl implements PrRepository {
  PrRepositoryImpl(this._dataSource);

  final PrDataSource _dataSource;

  @override
  Future<Result<List<PrBasicInfoModel>>> loadSearchedPrList(
      {required String query, required int perPage, required int page}) async {
    try {
      final response = await _dataSource.loadSearchedIssues(
          query: query, perPage: perPage, page: page);
      final result =
          response.items.map((e) => PrBasicInfoModel.fromResponse(e)).toList();
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<SearchedPrCollectionModel>> loadSearchedPrCollection(
      {required String query, required int perPage, required int page}) async {
    try {
      final response = await _dataSource.loadSearchedIssues(
          query: query, perPage: perPage, page: page);
      final result = SearchedPrCollectionModel.fromResponse(response);
      return Result.success(result);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
