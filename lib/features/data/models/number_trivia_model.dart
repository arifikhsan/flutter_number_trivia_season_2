import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/features/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  NumberTriviaModel({
    @required String text,
    @required int number,
  }) : super(text: text, number: number);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
    return NumberTriviaModel(
      text: json['text'],
      number: (json['number'] as num).toInt(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }
}

// aa() {
//   var apa = NumberTriviaModel(text: 'asdf', number: 234);
//   apa.toJson();
//   NumberTriviaModel.fromJson(json);
// }
