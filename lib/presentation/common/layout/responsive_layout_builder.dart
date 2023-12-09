import 'package:flutter/material.dart';
import 'package:github_search_app/app/config/app_size.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  const ResponsiveLayoutBuilder(this.child, {super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // 최대 넓이를 초과했을 경우
        if (constraints.maxWidth > AppSize.to.maxWidth) {
          return Stack(
            children: [
              Container(
                color: Colors.white,
              ),
              Center(
                child: SizedBox(
                  width: AppSize.to.maxWidth, // 가운데 화면의 너비
                  child: child,
                ),
              ),
            ],
          );
        } else {
          return child;
        }
      },
    );
  }
}
