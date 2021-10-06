import 'package:boilerplate/features/auth/data/model/auth_model.dart';

import '../usecases/login_usecase.dart';

abstract class AuthRepository {
  Future<AuthModel> login(LoginParams params);

  Future<bool> logoutUser();

  Future<bool> isOnline();

  Future<bool> isUserLogIn();
}
