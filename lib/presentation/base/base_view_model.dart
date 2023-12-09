import 'package:flutter/cupertino.dart';
import 'package:github_search_app/app/modules/di/locator.dart';

///
/// 기본 ViewModel 모듈
///

abstract class BaseViewModel extends ChangeNotifier {
  BaseViewModel() {
    onInit();
  }

  bool loading = false;

  late BuildContext context;

  void safeUpdate<T extends BaseViewModel>() {
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
  void onReady() {
    Future.delayed(Duration.zero);
  }

  @protected
  void onDispose() {}

  Future<void> delayedUntilMount() async {
    await Future.delayed(Duration.zero);
  }

  void initContext(BuildContext contextArg) {
    context = contextArg;
  }
}
