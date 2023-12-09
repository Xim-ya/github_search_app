import 'package:intl/intl.dart';

extension StringExtension on String {
  ///
  /// 현재 일을 기준으로 전달 받은 '날짜'와의
  /// 기간을 포맷하여 리턴함
  ///
  String get getDateDifferenceFromNow {
    int diffSeconds = DateTime.now().difference(DateTime.parse(this)).inSeconds;

    if (diffSeconds < 60) {
      return '$diffSeconds초 전';
    } else if (diffSeconds < 3600) {
      return '${diffSeconds ~/ 60}분 전';
    } else if (diffSeconds < 86400) {
      return '${diffSeconds ~/ 3600}시간 전';
    } else if (diffSeconds < 2592000) {
      return '${diffSeconds ~/ 86400}일 전';
    } else if (diffSeconds < 31536000) {
      return '${diffSeconds ~/ 2592000}달 전';
    } else {
      return '${diffSeconds ~/ 31536000}년 전';
    }
  }

  String get dateToyyyyMd {
    return DateFormat('yyyy년도 M월 d일').format(DateTime.parse(this));
  }
}
