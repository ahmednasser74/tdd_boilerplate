import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class IsUserLoginUseCase extends UseCase<Future<bool>, NoParams> {
  final AuthRepository authRepository;

  IsUserLoginUseCase({required this.authRepository});

  @override
  Future<bool> call({required NoParams params}) async {
    return await authRepository.isUserLogIn();
  }
}
