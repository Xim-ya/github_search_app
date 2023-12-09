///
/// 네트워크 Exception
///

enum DomainExceptionType {
  parsingFail('클라이언트에서 잘못된 데이터를 전달받고 있습니다. 문제가 지속되면 고객센터로 문의주세요');

  const DomainExceptionType(this.description);

  final String description;
}
