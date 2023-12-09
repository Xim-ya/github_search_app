///
/// 앱에서 사용되는 정규 표현식 로직
///

abstract class AppRegex {
  ///
  /// 깃허브 issue Url을 기반으로
  /// '레포 소유자 이름' '레포 제목', '레포 인덱스를' 추출하는 메소드
  /// ex) i: https://api.github.com/repos/Xim-ya/clean_ui_code_implementation/issues/1
  ///     o: ['Xim-ya', 'clean_ui_code_implementation', '1'];
  ///
  static List<String>? parseGitHubIssueUrl(String url) {
    RegExpMatch? match =
        RegExp(r"https://api\.github\.com/repos/([^/]+)/([^/]+)/issues/(\d+)")
            .firstMatch(url);
    return match?.groups([1, 2, 3]).toList().cast<String>();
  }
}
