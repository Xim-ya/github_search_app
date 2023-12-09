import 'package:flutter/material.dart';
import 'package:github_search_app/app/constant/index.dart';

///
/// 이슈 상태를 나타내는 enum
///

enum IssueState {
  open('open', '열려 있음', AppAssets.issueIcon, Color(0xFF22863A)),
  closed('close', '닫힘', AppAssets.issueClosedIcon, Color(0xFF7C52DC));

  final String tag;
  final String text;
  final String icon;
  final Color color;

  static getStateByTag(String tag) {
    return values.firstWhere(
      (state) => state.tag == tag,
      orElse: () => throw Exception('잘못된 반환값'),
    );
  }

  const IssueState(this.tag, this.text, this.icon, this.color);
}
