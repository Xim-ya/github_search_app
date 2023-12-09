import 'package:flutter/material.dart';
import 'package:github_search_app/app/config/app_color.dart';

class ShadowCard extends StatelessWidget {
  const ShadowCard({Key? key, required this.child, this.padding, this.margin})
      : super(key: key);

  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            spreadRadius: 5,
            blurRadius: 11,
            offset: Offset(1, 6), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
