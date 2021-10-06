import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInformation {
  Future<bool> get isConnected;
}

class NetworkInformationImp implements NetworkInformation {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInformationImp({required this.internetConnectionChecker});
  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}
