import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/features/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/presentation/widgets/shared/white_board.dart';

class TriviaLoaded extends StatelessWidget {
  final NumberTrivia numberTrivia;

  const TriviaLoaded({
    Key key,
    @required this.numberTrivia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteBoard(
      edgeColor: Colors.green.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            numberTrivia.number.toString(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            numberTrivia.text,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
