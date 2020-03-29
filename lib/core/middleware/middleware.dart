import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/core/middleware/click_dismiss.dart';

class Middleware extends StatelessWidget {
  final Widget child;

  const Middleware({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickDismiss(
      child: child,
    );
  }
}
