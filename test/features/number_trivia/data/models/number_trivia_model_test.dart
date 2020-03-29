import 'dart:convert';

import 'package:flutter_number_trivia/features/data/models/number_trivia_model.dart';
import 'package:flutter_number_trivia/features/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/helper/fixture.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final testNumberTriviaModel = NumberTriviaModel(text: 'test', number: 1);

  test('should be a subclass of NumberTrivia entitry', () {
    expect(testNumberTriviaModel, isA<NumberTrivia>());
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () {
      final actual = testNumberTriviaModel.toJson();
      final matcher = {'text': 'test', 'number': 1};
      expect(actual, matcher);
    });
  });

  group('fromJson', () {
    test('should resturn a valid model when the JSON number is an integer', () {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia'));
      final actual = NumberTriviaModel.fromJson(jsonMap);
      expect(actual, testNumberTriviaModel);
    });

    test(
        'should return a valid model when the json number is regarded as a double',
        () {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double'));
      final actual = NumberTriviaModel.fromJson(jsonMap);
      expect(actual, testNumberTriviaModel);
    });
  });
}
