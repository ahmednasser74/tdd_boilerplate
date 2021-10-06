import 'package:boilerplate/features/auth/data/model/auth_model.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase extends UseCase<Future<AuthModel>, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<AuthModel> call({required LoginParams params}) {
    return authRepository.login(params);
  }
}

class LoginParams extends Equatable {
  const LoginParams({required this.userName, required this.password});

  final String userName, password;

  @override
  List<Object?> get props => [userName, password];
}
