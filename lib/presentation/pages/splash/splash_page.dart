import 'package:flutter/material.dart';
import 'package:github_search_app/app/constant/index.dart';
import 'package:github_search_app/presentation/base/base_page.dart';
import 'package:github_search_app/presentation/pages/splash/splash_view_model.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends BasePage<SplashViewModel> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppAssets.githubSplashLottie,
        onLoaded: vm(context).routeToHome,
      ),
    );
  }
}
