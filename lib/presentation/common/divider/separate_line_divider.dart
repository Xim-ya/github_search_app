import 'package:flutter/material.dart';
import 'package:github_search_app/app/config/app_color.dart';

class SeparateDivider extends StatelessWidget {
  const SeparateDivider(
      {Key? key, required this.thickness, this.color, this.padding})
      : super(key: key);

  final double thickness;
  final Color? color;
  final EdgeInsets? padding;

  factory SeparateDivider.thin() => const SeparateDivider(thickness: 0.2);
  factory SeparateDivider.thick(Color color) =>
      const SeparateDivider(thickness: 8);

  @override
  Widget build(BuildContext context) {
    return Divider(
        height: 0, thickness: thickness, color: color ?? AppColor.lightGrey);
  }
}
