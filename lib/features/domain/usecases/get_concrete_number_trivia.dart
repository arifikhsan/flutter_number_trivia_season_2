import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/error/failure.dart';
import 'package:flutter_number_trivia/core/usecase/params.dart';
import 'package:flutter_number_trivia/core/usecase/usecase.dart';
import 'package:flutter_number_trivia/features/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements Usecase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}
