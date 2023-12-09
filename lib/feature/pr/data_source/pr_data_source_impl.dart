import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/feature/pr/index.dart';

final class PrDataSourceImpl with ApiErrorHandlerMixin implements PrDataSource {
  final PrApi _api;

  PrDataSourceImpl(this._api);

  @override
  Future<SearchedPrResponse> loadSearchedIssues(
          {required String query, required int perPage, required int page}) =>
      loadResponseOrThrow(
        () => loadResponseOrThrow(
          () => _api.loadSearchedPRList('is:pr $query', perPage, page),
        ),
      );
}
