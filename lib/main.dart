import 'package:flutter/material.dart';
import 'package:github_search_app/app/config/index.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/presentation/common/index.dart';

import 'app/modules/local_storage/app_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLocal.initHive();
  AppBinding.dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Github Search App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.basicTheme,
      routerConfig: AppRouter.router,
      builder: (context, child) {
        AppSize.to.init(context);
        return ResponsiveLayoutBuilder(child!);
      },
    );
  }
}
