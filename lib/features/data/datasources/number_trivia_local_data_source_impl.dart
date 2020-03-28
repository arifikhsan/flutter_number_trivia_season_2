import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/core/error/cache_exception.dart';
import 'package:flutter_number_trivia/core/global/constant.dart';
import 'package:flutter_number_trivia/features/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_number_trivia/features/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;

  NumberTriviaLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache) {
    return sharedPreferences.setString(
      Constant.CACHED_NUMBER_TRIVIA,
      json.encode(triviaToCache.toJson()),
    );
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final String jsonString =
        sharedPreferences.getString(Constant.CACHED_NUMBER_TRIVIA);
    if (jsonString != null) {
      return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
