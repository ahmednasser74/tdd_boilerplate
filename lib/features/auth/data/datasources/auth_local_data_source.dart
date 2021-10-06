import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> saveUserToken(String userToken);
  Future<String?> getUserToken();
  Future<bool> deleteUserToken();
}

const prefsUserToken = 'prefsUserToken';

class AuthLocalDataSourceImp implements AuthLocalDataSource {
  const AuthLocalDataSourceImp({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Future<bool> saveUserToken(String userToken) {
    return sharedPreferences.setString(prefsUserToken, userToken);
  }

  @override
  Future<String?> getUserToken() async {
    return await sharedPreferences.getString(prefsUserToken);
  }

  @override
  Future<bool> deleteUserToken() async {
    return await sharedPreferences.remove(prefsUserToken);
  }
}
