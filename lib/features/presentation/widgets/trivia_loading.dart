import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/features/presentation/widgets/shared/white_board.dart';

class TriviaLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WhiteBoard(
      edgeColor: Colors.blue.shade300,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
