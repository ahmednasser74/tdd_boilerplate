import 'dart:io';
import 'package:boilerplate/core/utils/default_service.dart';
import 'package:boilerplate/features/auth/data/model/auth_model.dart';
import '../../domin/usecases/login_usecase.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(LoginParams params);
}

class AuthRemoteDataSourceImp extends DefaultGetConnect
    implements AuthRemoteDataSource {
  @override
  Future<AuthModel> login(LoginParams params) async {
    final response = await getData(path: 'seller-menu/list/1');

    if (response.statusCode == 200) {
      final json = response.body;
      final data = AuthModel.fromJson(json);
      return data;
    } else {
      print('statusCode = ${response.statusCode}');
      throw SocketException('Error Loading seller-menu');
    }
  }
}
