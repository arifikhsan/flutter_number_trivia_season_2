import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/error/failure.dart';
import 'package:flutter_number_trivia/core/usecase/no_params.dart';
import 'package:flutter_number_trivia/core/usecase/usecase.dart';
import 'package:flutter_number_trivia/features/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements Usecase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
