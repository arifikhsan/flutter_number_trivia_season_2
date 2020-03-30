import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/features/presentation/widgets/shared/white_board.dart';

class TriviaError extends StatelessWidget {
  final String message;

  const TriviaError({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteBoard(
      edgeColor: Colors.red.shade300,
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
