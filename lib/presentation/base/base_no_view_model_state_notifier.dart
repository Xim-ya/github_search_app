import 'package:flutter/material.dart';
import 'package:github_search_app/presentation/base/base_state_notifier.dart';
import 'package:provider/provider.dart';

///
/// [BaseStateNotifier] 1대1 대응되는 위젯 모듈
/// 위젯이 화면이 노출되면 [BaseStateNotifier]가 생성됨
///

abstract class BaseNoViewModelStateNotifierView<S extends BaseStateNotifier>
    extends StatelessWidget {
  const BaseNoViewModelStateNotifierView({Key? key}) : super(key: key);

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
