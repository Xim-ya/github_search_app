import 'package:intl/intl.dart';

extension IntExtension on int {
  ///
  /// K M F 단위로 포맷
  ///
  String get getKMBFFormat {
    return NumberFormat.compact(locale: "en_US", explicitSign: false)
        .format(this);
  }

  ///
  /// 천 단위로 ','를 붙임
  ///
  String get getCommaSeparatedNum {
    return NumberFormat("#,##0", "en_US").format(this);
  }
}
