import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/core/error/server_exception.dart';
import 'package:flutter_number_trivia/features/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_trivia/features/data/models/number_trivia_model.dart';
import 'package:http/http.dart';

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final Client client;

  NumberTriviaRemoteDataSourceImpl({
    @required this.client,
  });

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    final response = await client.get(
      'http://numbersapi.com/$number',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Future.value(
        NumberTriviaModel.fromJson(json.decode(response.body)),
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    final response = await client.get(
      'http://numbersapi.com/random',
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Future.value(
        NumberTriviaModel.fromJson(json.decode(response.body)),
      );
    } else {
      throw ServerException();
    }
  }
}
