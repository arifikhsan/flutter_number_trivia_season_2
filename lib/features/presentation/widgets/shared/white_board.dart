import 'package:flutter/material.dart';

class WhiteBoard extends StatelessWidget {
  final Color edgeColor;
  final Widget child;

  const WhiteBoard({
    Key key,
    @required this.edgeColor,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: edgeColor,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
