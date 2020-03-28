import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_number_trivia/core/network/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  DataConnectionChecker connectionChecker;

  NetworkInfoImpl(
    this.connectionChecker,
  );

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
