import 'package:flutter/material.dart';
import 'package:github_search_app/app/constant/index.dart';

///
/// PR의 상태를 나타내는 enum
/// 아래와 같은 상태를 가지고 있음.
/// 1. open
/// 2. closed
/// 3. merged
/// 4. Draft
///

enum PrState {
  open('open', '열려 있음', AppAssets.prOpen, Color(0xFF22863A)),
  closed('closed', '닫힘', AppAssets.prClosed, Color(0xFFBA3638)),
  merged('merged', '병합된', AppAssets.prMerged, Color(0xFF54349D)),
  draft('draft', '초안', AppAssets.prDraft, Color(0xFF525560));

  final String tag;
  final String text;
  final String icon;
  final Color color;

  static PrState getPrStateByValue(
      {required String originState,
      required bool draft,
      required bool isMerged}) {
    if (originState == 'open') {
      return draft ? PrState.draft : PrState.open;
    } else {
      return isMerged ? PrState.merged : PrState.closed;
    }
  }

  static getStateByTag(String tag) {
    return values.firstWhere(
      (state) => state.tag == tag,
      orElse: () {
        throw Exception('잘못된 반환값');
      },
    );
  }

  const PrState(this.tag, this.text, this.icon, this.color);
}
