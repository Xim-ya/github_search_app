import 'package:flutter/material.dart';
import 'package:github_search_app/presentation/base/base_view_model.dart';
import 'package:provider/provider.dart';

///
/// 기본 View 위젯 모듈.
/// [BaseViewModel]과 연결됨.
///

abstract class BaseView<T extends BaseViewModel> extends StatelessWidget {
  const BaseView({Key? key}) : super(key: key);

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
