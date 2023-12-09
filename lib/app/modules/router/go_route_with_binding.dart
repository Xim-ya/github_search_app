import 'package:flutter/cupertino.dart';
import 'package:github_search_app/app/modules/router/route_binding.dart';
import 'package:go_router/go_router.dart';

///
/// 화면이 전활될 때 바인딩 모듈을 작동할 수 있도록 도와주는 모듈
/// 조건에 따라 [RouteBinding] 메소드를 실행시킴
///
class GoRouteWithBinding extends GoRoute {
  GoRouteWithBinding({
    required this.binding,
    required String path,
    this.routePageBuilder,
    this.routeBuilder,
    List<RouteBase>? routes,
    required List<String> prevPath,
  })  : assert(routePageBuilder != null || routeBuilder != null,
            'newPageBuilder 또는 newBuilder 속성을 넘겨주어야 합니다'),
        super(
          path: path,
          builder: routeBuilder != null
              ? (context, state) => _getBuilder(
                  routeBuilder, binding, path, prevPath, context, state)
              : null,
          pageBuilder: routePageBuilder != null
              ? (context, state) => _getBuilder(
                  routePageBuilder, binding, path, prevPath, context, state)
              : null,
          routes: routes ?? const <RouteBase>[],
        );

  final RouteBinding binding;
  final GoRouterWidgetBuilder? routeBuilder;
  final GoRouterPageBuilder? routePageBuilder;

  static dynamic _getBuilder(
    dynamic newBuilderOrPageBuilder,
    RouteBinding binding,
    String path,
    List<String> prevPath,
    BuildContext context,
    GoRouterState state,
  ) {
    final currentLocation = GoRouter.of(context).location;

    if (currentLocation.contains(path) &&
        binding.isDependenciesDeleted == true) {
      binding.dependencies();
      if (state.extra != null) {
        final Map<String, dynamic> arg = state.extra as Map<String, dynamic>;
        binding.arg1 = arg['arg1'];
        binding.arg2 = arg['arg2'];
      }

      return newBuilderOrPageBuilder(context, state);
    }

    if (prevPath.contains(currentLocation)) {
      binding.unRegisterDependencies();
    }

    return newBuilderOrPageBuilder(context, state);
  }
}
