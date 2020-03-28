import 'package:flutter_number_trivia/features/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
  Future<NumberTriviaModel> getLastNumberTrivia();
}
