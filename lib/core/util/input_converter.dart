import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/error/failure.dart';
import 'package:flutter_number_trivia/core/error/invalid_input_failure.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInteger(String string) {
    try {
      final integer = int.parse(string);
      if (integer <0 ) throw FormatException();
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}
