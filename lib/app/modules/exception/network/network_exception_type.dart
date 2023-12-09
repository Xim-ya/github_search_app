///
/// 네트워크 Exception 타입
/// DIO 에서 제공하는 기본 Exception과
/// 앱에서 추가로 고려해야되는 Exception들을 정의
///

enum NetworkExceptionType {
  connectionTimeout('인터넷 연결이 원활하지 않습니다.'),
  sendTimeout('서버에 데이터를 전송하는 중에 문제가 발생했습니다.'),
  receiveTimeout('서버로부터 데이터를 수신하는 중에 문제가 발생했습니다.'),
  badCertificate('접근할 수 없는 요청입니다'),
  badResponse('잘못된 요청값을 반환받았습니다.'),
  cancel('요청 중단되었습니다'),
  connectionError('인터넷에 연결되어 있지 않습니다.'),
  unknown('알 수 없는 인터넷 오류입니다.'),
  apiLimited('많은 데이터를 불러오는 과정에서 속도제한이 걸렸습니다. 잠시후 다시 시도해주세요.'),
  notModified('데이터가 변경되지 않았습니다.'),
  forbidden('접근이 금지되었습니다.'),
  validationFailed('유효성 검사에 실패했습니다.'),
  serviceUnavailable('현재 깃허브 서비스를 이용할 수 없습니다'),
  noResultFount('반환된 데이터가 없습니다');

  const NetworkExceptionType(this.description);

  final String description;
}
