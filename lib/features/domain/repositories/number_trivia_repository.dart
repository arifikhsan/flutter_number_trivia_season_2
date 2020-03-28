import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/error/failure.dart';
import 'package:flutter_number_trivia/features/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
