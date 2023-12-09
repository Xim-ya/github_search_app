import 'package:github_search_app/feature/pr/api/response/searched_pr_response.dart';
import 'package:github_search_app/feature/pr/data_source/pr_data_source.dart';

final class PrDataSourceFake implements PrDataSource {
  @override
  Future<SearchedPrResponse> loadSearchedIssues(
      {required String query, required int perPage, required int page}) {
    // TODO: implement loadSearchedIssues
    throw UnimplementedError();
  }
}
