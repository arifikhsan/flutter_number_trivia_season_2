import 'package:dartz/dartz.dart';
import 'package:flutter_number_trivia/core/usecase/params.dart';
import 'package:flutter_number_trivia/features/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_number_trivia/features/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final testNumber = 1;
  final testNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test('should get trivia for the number from the repository', () async {
    // arrange
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(testNumber))
        .thenAnswer((_) async => Right(testNumberTrivia));
    // act
    final result = await usecase(Params(number: testNumber));
    // assert
    expect(result, Right(testNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(testNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
