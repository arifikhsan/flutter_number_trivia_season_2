import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/usecase/no_params.dart';
import 'package:flutter_number_trivia/features/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_number_trivia/features/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetRandomNumberTrivia usecase;
  NumberTriviaRepository repository;

  setUp(() {
    repository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(repository);
  });

  final testNumberTrivia = NumberTrivia(text: 'test', number: 123);

  test('should get random', () async {
    // arrange
    when(repository.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(testNumberTrivia));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, Right(testNumberTrivia));
    verify(repository.getRandomNumberTrivia());
    verifyNoMoreInteractions(repository);
  });
}
