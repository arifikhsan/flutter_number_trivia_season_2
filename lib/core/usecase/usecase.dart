import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/error/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
