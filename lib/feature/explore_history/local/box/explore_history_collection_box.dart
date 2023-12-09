import 'package:github_search_app/feature/explore_history/local/box/issue_box.dart';
import 'package:github_search_app/feature/explore_history/local/box/pr_box.dart';
import 'package:github_search_app/feature/explore_history/local/box/repo_box.dart';
import 'package:github_search_app/feature/shared/box/user_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'explore_history_collection_box.g.dart';

@HiveType(typeId: 5)
class ExploreHistoryCollectionBox with HiveObjectMixin {
  @HiveField(0)
  List<UserBox> userList;

  @HiveField(1)
  List<RepoBox> repoList;

  @HiveField(2)
  List<IssueBox> issueList;

  @HiveField(3)
  List<PrBox> prList;

  ExploreHistoryCollectionBox({
    required this.userList,
    required this.repoList,
    required this.issueList,
    required this.prList,
  });

  ExploreHistoryCollectionBox copyWith({
    List<UserBox>? userList,
    List<RepoBox>? repoList,
    List<IssueBox>? issueList,
    List<PrBox>? prList,
  }) {
    return ExploreHistoryCollectionBox(
      userList: userList ?? this.userList,
      repoList: repoList ?? this.repoList,
      issueList: issueList ?? this.issueList,
      prList: prList ?? this.prList,
    );
  }
}
