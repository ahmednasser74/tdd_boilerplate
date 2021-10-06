import 'package:boilerplate/features/auth/data/model/auth_model.dart';

import '../../../../core/network/network_information.dart';
import '../../domin/repositories/auth_repository.dart';
import '../../domin/usecases/login_usecase.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthLocalDataSource userLocalDataSource;
  final AuthRemoteDataSource userRemoteDataSource;
  final NetworkInformation networkInformation;

  AuthRepositoryImp({
    required this.userLocalDataSource,
    required this.userRemoteDataSource,
    required this.networkInformation,
  });

  @override
  Future<AuthModel> login(LoginParams params) async {
    final user = await userRemoteDataSource.login(params);
    return user;
  }

  @override
  Future<bool> isOnline() => networkInformation.isConnected;

  @override
  Future<bool> logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isUserLogIn() async {
    final userToken = await userLocalDataSource.getUserToken();
    if (userToken != null)
      return true;
    else
      return false;
  }
}
