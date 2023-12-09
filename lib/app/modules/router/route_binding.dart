///
/// 화면 이동 시 바인딩 되어야하는 의존성을
/// 설정하도록 도와주는 모듈
///

abstract class RouteBinding {
  late dynamic arg1;
  late dynamic arg2;

  bool isDependenciesDeleted = true;

  void dependencies() {
    isDependenciesDeleted = false;
  }

  void unRegisterDependencies() {
    isDependenciesDeleted = true;
  }
}
