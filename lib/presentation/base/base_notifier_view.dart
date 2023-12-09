import 'package:flutter/material.dart';
import 'package:github_search_app/presentation/base/index.dart';
import 'package:provider/provider.dart';

///
/// 각 개별 State을 관리하는 모듈
/// [BaseStateNotifierView] 또는 [BaseNoViewModelStateNotifierView] 위젯과 함께 사용됨.
///

abstract class BaseStateNotifierView<T extends BaseViewModel,
    S extends BaseStateNotifier> extends StatelessWidget {
  const BaseStateNotifierView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<S>(
      create: (context) {
        final stateNotifier = createStateNotifier(context);
        stateNotifier.initContext(context);
        return stateNotifier;
      },
      lazy: setLazyInit,
      builder: (BuildContext context, Widget? child) {
        return buildView(context);
      },
    );
  }

  @protected
  T vm(BuildContext context) => Provider.of<T>(context, listen: false);

  @protected
  T vmR(BuildContext context) => context.read<T>();

  @protected
  T vmW(BuildContext context) => context.watch<T>();

  @protected
  K vmS<K>(BuildContext context, K Function(T) selector) {
    return context.select((T value) => selector(value));
  }

  @protected
  S sn(BuildContext context) => Provider.of<S>(context, listen: false);

  @protected
  S snW(BuildContext context) => context.watch<S>();

  @protected
  K snS<K>(BuildContext context, K Function(S) selector) {
    return context.select((S value) => selector(value));
  }

  @protected
  Widget buildView(BuildContext context);

  @protected
  bool get setLazyInit => false;

  @protected
  S createStateNotifier(BuildContext context);
}
