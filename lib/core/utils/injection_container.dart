import 'package:boilerplate/core/localization/translation_controller.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:boilerplate/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:boilerplate/features/auth/data/repositories/auth_repository_imp.dart';
import 'package:boilerplate/features/auth/domin/repositories/auth_repository.dart';
import 'package:boilerplate/features/auth/domin/usecases/is_user_login_use_case.dart';
import 'package:boilerplate/features/auth/domin/usecases/login_usecase.dart';
import 'package:boilerplate/features/auth/domin/usecases/logout_usecase.dart';
import 'package:boilerplate/features/auth/presentation/controller/login_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/splash_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Injection {
  static final sl = GetIt.instance;

  static Future<void> init() async {
    await _core();
    _authCycle();
  }

  static Future<void> _core() async {
    // shared preference
    await SharedPrefs.instance.init();
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
    // localization
    sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker(),
    );
    //controller
    sl.registerFactory<TranslationController>(() => TranslationController());
  }

  static void _authCycle() {
    // Controller
    sl.registerFactory<LoginController>(
      () => LoginController(
        loginUseCase: sl(),
        isOnlineUseCase: sl(),
        logoutUseCase: sl(),
      ),
    );
    sl.registerFactory<SplashController>(
      () => SplashController(isUserLoginUseCase: sl()),
    );

    // Use cases
    sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: sl()),
    );
    sl.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(authRepository: sl()),
    );
    sl.registerLazySingleton<IsUserLoginUseCase>(
      () => IsUserLoginUseCase(authRepository: sl()),
    );

    //repo
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImp(
        networkInformation: sl(),
        userLocalDataSource: sl(),
        userRemoteDataSource: sl(),
      ),
    );

    // Data sources
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(),
    );
  }
}
