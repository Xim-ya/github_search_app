import 'dart:developer';

import 'package:github_search_app/app/constant/enum/github_element_category.dart';
import 'package:github_search_app/app/modules/data_handling/data_state.dart';
import 'package:github_search_app/app/modules/router/route_argument.dart';
import 'package:github_search_app/feature/issue/repository/issue_repository.dart';
import 'package:github_search_app/feature/pr/repository/pr_repository.dart';
import 'package:github_search_app/feature/repo/repository/repo_repository.dart';
import 'package:github_search_app/feature/shared/models/github_data_collection_model.dart';
import 'package:github_search_app/feature/user/repository/user_repository.dart';
import 'package:github_search_app/presentation/base/base_state_notifier.dart';

class SearchedTotalStateNotifier extends BaseStateNotifier {
  SearchedTotalStateNotifier({
    required SearchedListPageRouteArg routeArg,
    required UserRepository userRepository,
    required RepoRepository repoRepository,
    required IssueRepository issueRepository,
    required PrRepository prRepository,
  })  : _routeArg = routeArg,
        _userRepository = userRepository,
        _repoRepository = repoRepository,
        _issueRepository = issueRepository,
        _prRepository = prRepository;

  ///
  /// 공통 기본 매개변수 값
  ///
  final int defaultPerPage = 3;
  final int defaultPage = 1;

  ///
  /// 이전 화면으로 부터 전달 받은 인자
  ///
  final SearchedListPageRouteArg _routeArg;

  ///
  /// 각 카테고리 레포지토리
  ///
  final UserRepository _userRepository;
  final RepoRepository _repoRepository;
  final IssueRepository _issueRepository;
  final PrRepository _prRepository;

  ///
  /// 검색된 콜렉션들의 Map
  ///
  Map<GithubElementCategory, Ds<GithubDataCollectionModel>> collectionMap = {};

  ///
  /// 검색된 [유저] 컬렉션 호충
  ///
  Future<void> _fetchUserCollection() async {
    final response = await _userRepository.loadSearchedUserCollection(
      query: _routeArg.keyword,
      perPage: defaultPerPage,
      page: defaultPage,
    );

    response.fold(
      onSuccess: (userCollection) {
        collectionMap[GithubElementCategory.user] = Fetched(userCollection);
      },
      onFailure: (e) {
        collectionMap[GithubElementCategory.user] = Failed(e);
        log('유저 --> ${e.toString()}');
      },
    );
  }

  ///
  /// 검색된 [레포지토리] 컬렉션 호충
  ///
  Future<void> _fetchRepositoryCollection() async {
    final response = await _repoRepository.loadSearchedRepositoryCollection(
      query: _routeArg.keyword,
      perPage: defaultPerPage,
      page: defaultPage,
    );

    response.fold(
      onSuccess: (repositoryCollection) {
        collectionMap[GithubElementCategory.repository] =
            Fetched(repositoryCollection);
      },
      onFailure: (e) {
        collectionMap[GithubElementCategory.repository] = Failed(e);
        log('레포지토리 --> ${e.toString()}');
      },
    );
  }

  ///
  /// 검색된 [이슈] 컬렉션 호충
  ///
  Future<void> _fetchIssueCollection() async {
    final response = await _issueRepository.loadSearchedIssueCollection(
      query: _routeArg.keyword,
      perPage: defaultPerPage,
      page: defaultPage,
    );

    response.fold(
      onSuccess: (issueCollection) {
        collectionMap[GithubElementCategory.issue] = Fetched(issueCollection);
      },
      onFailure: (e) {
        collectionMap[GithubElementCategory.issue] = Failed(e);
        log('이슈 --> ${e.toString()}');
      },
    );
  }

  ///
  /// 검색된 [PR] 컬렉션 호충
  ///
  Future<void> _fetchPrCollection() async {
    final response = await _prRepository.loadSearchedPrCollection(
      query: _routeArg.keyword,
      perPage: defaultPerPage,
      page: defaultPage,
    );

    response.fold(
      onSuccess: (prCollection) {
        collectionMap[GithubElementCategory.pr] = Fetched(prCollection);
      },
      onFailure: (e) {
        collectionMap[GithubElementCategory.pr] = Failed(e);
        log('PR --> ${e.toString()}');
      },
    );
  }

  @override
  void onInit() async {
    super.onInit();
    Future.wait([
      _fetchUserCollection(),
      _fetchRepositoryCollection(),
      _fetchIssueCollection(),
      _fetchPrCollection(),
    ]).whenComplete(() {
      print('@@@@ 그래도 작동?');
      print(collectionMap[GithubElementCategory.issue]?.state);
      loaded = true;
      notifyListeners();
    });
  }
}
