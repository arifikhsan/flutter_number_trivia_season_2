import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_number_trivia/core/error/cache_exception.dart';
import 'package:flutter_number_trivia/core/error/cache_failure.dart';
import 'package:flutter_number_trivia/core/error/failure.dart';
import 'package:flutter_number_trivia/core/error/server_exception.dart';
import 'package:flutter_number_trivia/core/error/server_failure.dart';
import 'package:flutter_number_trivia/core/network/network_info.dart';
import 'package:flutter_number_trivia/features/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_number_trivia/features/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_trivia/features/domain/entities/number_trivia.dart';
import 'package:flutter_number_trivia/features/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepostiroyImpl implements NumberTriviaRepository {
  final NumberTriviaRemoteDataSource remoteDataSource;
  final NumberTriviaLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NumberTriviaRepostiroyImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia =
            await remoteDataSource.getConcreteNumberTrivia(number);
        await localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await remoteDataSource.getRandomNumberTrivia();
        await localDataSource.cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
