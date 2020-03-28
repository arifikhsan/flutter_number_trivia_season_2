import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_number_trivia/core/network/network_info.dart';
import 'package:flutter_number_trivia/core/network/network_info_impl.dart';
import 'package:flutter_number_trivia/core/util/input_converter.dart';
import 'package:flutter_number_trivia/features/data/datasources/number_trivia_local_data_source.dart';
import 'package:flutter_number_trivia/features/data/datasources/number_trivia_local_data_source_impl.dart';
import 'package:flutter_number_trivia/features/data/datasources/number_trivia_remote_data_source.dart';
import 'package:flutter_number_trivia/features/data/datasources/number_trivia_remote_data_source_impl.dart';
import 'package:flutter_number_trivia/features/data/repositories/number_trivia_repository_impl.dart';
import 'package:flutter_number_trivia/features/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_number_trivia/features/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_number_trivia/features/domain/usecases/get_random_number_trivia.dart';
import 'package:flutter_number_trivia/features/presentation/bloc/number_trivia_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  //* Features - Number Trivia
  locator.registerFactory(
    () => NumberTriviaBloc(
      concrete: locator(),
      random: locator(),
      inputConverter: locator(),
    ),
  );

  //* Usecases
  locator.registerLazySingleton(() => GetConcreteNumberTrivia(locator()));
  locator.registerLazySingleton(() => GetRandomNumberTrivia(locator()));

  //* Repository
  locator.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepostiroyImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
      networkInfo: locator(),
    ),
  );

  //* Data sources
  locator.registerLazySingleton<NumberTriviaRemoteDataSource>(
    () => NumberTriviaRemoteDataSourceImpl(client: locator()),
  );
  locator.registerLazySingleton<NumberTriviaLocalDataSource>(
    () => NumberTriviaLocalDataSourceImpl(sharedPreferences: locator()),
  );

  //* Core
  locator.registerLazySingleton(() => InputConverter());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  //* External
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => Client());
  locator.registerLazySingleton(() => DataConnectionChecker());
}
