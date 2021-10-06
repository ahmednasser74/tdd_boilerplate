import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/auth/domin/usecases/is_user_login_use_case.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final IsUserLoginUseCase isUserLoginUseCase;

  SplashController({required this.isUserLoginUseCase});

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 1), () => splashNavigation());
  }

  void splashNavigation() async {
    final isUserLogin = await isUserLoginUseCase(params: NoParams());
    if (isUserLogin)
      //navigate to homeScreen
      Get.offNamed('');
    else
      //navigate to loginScreen
      Get.offNamed('page');
  }
}
