import 'package:flutter/cupertino.dart';
import 'package:github_search_app/app/modules/di/locator.dart';

///
/// 개별 state을 관리하는 StateNotifier 모듈
///

abstract class BaseStateNotifier extends ChangeNotifier {
  BaseStateNotifier() {
    onInit();
  }

  bool loaded = false;

  late BuildContext context;

  void safeUpdate<T extends BaseStateNotifier>() {
    if (locator.isRegistered<T>()) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }

  @protected
  void onInit() {}

  @protected
  void onDispose() {}

  Future<void> delayedUntilMount() async {
    await Future.delayed(Duration.zero);
  }

  void initContext(BuildContext contextArg) {
    context = contextArg;
  }
}
