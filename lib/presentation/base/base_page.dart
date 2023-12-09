import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:github_search_app/app/config/index.dart';
import 'package:github_search_app/app/modules/index.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:provider/provider.dart';

///
/// 페이지 유틸리티 모듈
///

abstract class BasePage<T extends BaseViewModel> extends StatelessWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (context) {
        final vm = locator<T>();
        vm.initContext(context);
        return vm;
      },
      lazy: setLazyInit,
      builder: (BuildContext context, Widget? child) {
        return ConditionalWillPopScope(
          shouldAddCallback: preventSwipeBack,
          onWillPop: () async {
            return false;
          },
          child: Container(
            color: unSafeAreaColor,
            child: wrapWithSafeArea
                ? SafeArea(
                    top: setTopSafeArea,
                    bottom: setBottomSafeArea,
                    child: _buildScaffold(context),
                  )
                : _buildScaffold(context),
          ),
        );
      },
    );
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
      extendBody: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: buildAppBar(context),
      body: buildPage(context),
      backgroundColor: screenBackgroundColor,
      bottomNavigationBar: buildBottomNavigationBar(context),
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: buildFloatingActionButton(context),
    );
  }

  @protected
  Color? get unSafeAreaColor => AppColor.white;

  @protected
  bool get resizeToAvoidBottomInset => true;

  @protected
  Widget? buildFloatingActionButton(BuildContext context) => null;

  @protected
  FloatingActionButtonLocation? get floatingActionButtonLocation => null;

  @protected
  bool get extendBodyBehindAppBar => false;

  @protected
  bool get preventSwipeBack => false;

  @protected
  Color? get screenBackgroundColor => AppColor.white;

  @protected
  Widget? buildBottomNavigationBar(BuildContext context) => null;

  @protected
  Widget buildPage(BuildContext context);

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @protected
  bool get wrapWithSafeArea => true;

  @protected
  bool get setLazyInit => false;

  @protected
  bool get setBottomSafeArea => true;

  @protected
  bool get setTopSafeArea => true;

  @protected
  T vm(BuildContext context) => Provider.of<T>(context, listen: false);

  @protected
  T vmR(BuildContext context) => context.read<T>();

  @protected
  T vmW(BuildContext context) => context.watch<T>();

  @protected
  S vmS<S>(BuildContext context, S Function(T) selector) {
    return context.select((T value) => selector(value));
  }
}
