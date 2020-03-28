import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/features/domain/entities/number_trivia.dart';

class TriviaLoaded extends StatelessWidget {
  final NumberTrivia numberTrivia;

  const TriviaLoaded({
    Key key,
    @required this.numberTrivia,
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
            color: Colors.green.shade300,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
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
