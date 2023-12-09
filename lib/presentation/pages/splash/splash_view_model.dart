import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:github_search_app/presentation/pages/home/home_page.dart';
import 'package:github_search_app/presentation/pages/splash/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashViewModel extends BaseViewModel {
  ///
  /// [SplashPage]가 나타나고
  /// 일정 딜리에 이후 [HomePage]로 이동
  ///
  Future<void> routeToHome(LottieComposition composition) async {
    await Future.delayed(const Duration(milliseconds: 2200)).then(
      (_) => context.go(AppPages.home),
    );
  }

  @override
  void onDispose() {
    super.onDispose();
    locator.unregister<SplashViewModel>();
  }
}
