import 'package:github_search_app/feature/repo/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repo_item_response.g.dart';

@JsonSerializable()
class RepoItemResponse {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'node_id')
  final String nodeId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'owner')
  final RepoOwnerResponse owner;
  @JsonKey(name: 'private')
  final bool private;
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'fork')
  final bool fork;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'pushed_at')
  final String? pushedAt;
  @JsonKey(name: 'homepage')
  final String? homepage;
  @JsonKey(name: 'size')
  final int size;
  @JsonKey(name: 'stargazers_count')
  final int stargazersCount;
  @JsonKey(name: 'watchers_count')
  final int watchersCount;
  @JsonKey(name: 'language')
  final String? language;
  @JsonKey(name: 'forks_count')
  final int forksCount;
  @JsonKey(name: 'open_issues_count')
  final int openIssuesCount;
  @JsonKey(name: 'default_branch')
  final String defaultBranch;
  @JsonKey(name: 'score')
  final double score;
  @JsonKey(name: 'archive_url')
  final String archiveUrl;
  @JsonKey(name: 'assignees_url')
  final String assigneesUrl;
  @JsonKey(name: 'blobs_url')
  final String blobsUrl;
  @JsonKey(name: 'branches_url')
  final String branchesUrl;
  @JsonKey(name: 'collaborators_url')
  final String collaboratorsUrl;
  @JsonKey(name: 'comments_url')
  final String commentsUrl;
  @JsonKey(name: 'commits_url')
  final String commitsUrl;
  @JsonKey(name: 'compare_url')
  final String compareUrl;
  @JsonKey(name: 'contents_url')
  final String contentsUrl;
  @JsonKey(name: 'contributors_url')
  final String contributorsUrl;
  @JsonKey(name: 'deployments_url')
  final String deploymentsUrl;
  @JsonKey(name: 'downloads_url')
  final String downloadsUrl;
  @JsonKey(name: 'events_url')
  final String eventsUrl;
  @JsonKey(name: 'forks_url')
  final String forksUrl;
  @JsonKey(name: 'git_commits_url')
  final String gitCommitsUrl;
  @JsonKey(name: 'git_refs_url')
  final String gitRefsUrl;
  @JsonKey(name: 'git_tags_url')
  final String gitTagsUrl;
  @JsonKey(name: 'git_url')
  final String gitUrl;
  @JsonKey(name: 'issue_comment_url')
  final String issueCommentUrl;
  @JsonKey(name: 'issue_events_url')
  final String issueEventsUrl;
  @JsonKey(name: 'issues_url')
  final String issuesUrl;
  @JsonKey(name: 'keys_url')
  final String keysUrl;
  @JsonKey(name: 'labels_url')
  final String labelsUrl;
  @JsonKey(name: 'languages_url')
  final String languagesUrl;
  @JsonKey(name: 'merges_url')
  final String mergesUrl;
  @JsonKey(name: 'milestones_url')
  final String milestonesUrl;
  @JsonKey(name: 'notifications_url')
  final String notificationsUrl;
  @JsonKey(name: 'pulls_url')
  final String pullsUrl;
  @JsonKey(name: 'releases_url')
  final String releasesUrl;
  @JsonKey(name: 'ssh_url')
  final String sshUrl;
  @JsonKey(name: 'stargazers_url')
  final String stargazersUrl;
  @JsonKey(name: 'statuses_url')
  final String statusesUrl;
  @JsonKey(name: 'subscribers_url')
  final String subscribersUrl;
  @JsonKey(name: 'subscription_url')
  final String subscriptionUrl;
  @JsonKey(name: 'tags_url')
  final String tagsUrl;
  @JsonKey(name: 'teams_url')
  final String teamsUrl;
  @JsonKey(name: 'trees_url')
  final String treesUrl;
  @JsonKey(name: 'clone_url')
  final String cloneUrl;
  @JsonKey(name: 'mirror_url')
  final String? mirrorUrl;
  @JsonKey(name: 'hooks_url')
  final String hooksUrl;
  @JsonKey(name: 'svn_url')
  final String svnUrl;
  @JsonKey(name: 'forks')
  final int forks;
  @JsonKey(name: 'open_issues')
  final int openIssues;
  @JsonKey(name: 'watchers')
  final int watchers;
  @JsonKey(name: 'has_issues')
  final bool hasIssues;
  @JsonKey(name: 'has_projects')
  final bool hasProjects;
  @JsonKey(name: 'has_pages')
  final bool hasPages;
  @JsonKey(name: 'has_wiki')
  final bool hasWiki;
  @JsonKey(name: 'has_downloads')
  final bool hasDownloads;
  @JsonKey(name: 'archived')
  final bool archived;
  @JsonKey(name: 'disabled')
  final bool disabled;
  @JsonKey(name: 'visibility')
  final String visibility;

  RepoItemResponse({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.owner,
    required this.private,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.homepage,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    required this.language,
    required this.forksCount,
    required this.openIssuesCount,
    required this.defaultBranch,
    required this.score,
    required this.archiveUrl,
    required this.assigneesUrl,
    required this.blobsUrl,
    required this.branchesUrl,
    required this.collaboratorsUrl,
    required this.commentsUrl,
    required this.commitsUrl,
    required this.compareUrl,
    required this.contentsUrl,
    required this.contributorsUrl,
    required this.deploymentsUrl,
    required this.downloadsUrl,
    required this.eventsUrl,
    required this.forksUrl,
    required this.gitCommitsUrl,
    required this.gitRefsUrl,
    required this.gitTagsUrl,
    required this.gitUrl,
    required this.issueCommentUrl,
    required this.issueEventsUrl,
    required this.issuesUrl,
    required this.keysUrl,
    required this.labelsUrl,
    required this.languagesUrl,
    required this.mergesUrl,
    required this.milestonesUrl,
    required this.notificationsUrl,
    required this.pullsUrl,
    required this.releasesUrl,
    required this.sshUrl,
    required this.stargazersUrl,
    required this.statusesUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.tagsUrl,
    required this.teamsUrl,
    required this.treesUrl,
    required this.cloneUrl,
    required this.mirrorUrl,
    required this.hooksUrl,
    required this.svnUrl,
    required this.forks,
    required this.openIssues,
    required this.watchers,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasPages,
    required this.hasWiki,
    required this.hasDownloads,
    required this.archived,
    required this.disabled,
    required this.visibility,
  });

  factory RepoItemResponse.fromJson(Map<String, dynamic> json) =>
      _$RepoItemResponseFromJson(json);
}
