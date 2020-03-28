import 'package:flutter/material.dart';

class Middleware extends StatelessWidget {
  final Widget child;

  const Middleware({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(child: child),
    );
  }
}

class Parent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Middleware(
      child: Child(),
    );
  }
}

class Child extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello there...');
  }
}
