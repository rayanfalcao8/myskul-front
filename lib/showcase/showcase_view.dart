import 'package:flutter/material.dart';

class ShowCaseView extends StatelessWidget {
  final GlobalKey globalKey;
  final String title;
  final String description;
  final Widget child;
  final ShapeBorder shapeBorder;

  ShowCaseView({
    super.key,
    required this.globalKey,
    required this.title,
    required this.description,
    required this.child,
    this.shapeBorder = const CircleBorder(),
  });

  @override
  Widget build(BuildContext context) {
    return ShowCaseView(
      globalKey: globalKey,
      title: title,
      description: description,
      shapeBorder: shapeBorder,
      child: child,
    );
  }
}
