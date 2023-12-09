import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

extension GoRouterExtensino on BuildContext {
  ///
  /// 특정 라우트가 될 때까지 pop
  ///
  void popUntil(String routePath) {
    final router = GoRouter.of(this);
    while (router
            .routerDelegate.currentConfiguration.matches.last.matchedLocation !=
        routePath) {
      if (!canPop()) {
        return;
      }
      pop();
    }
  }
}
