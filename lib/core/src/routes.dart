import 'package:boilerplate/features/auth/presentation/screen/login_screen.dart';
import 'package:boilerplate/features/auth/presentation/screen/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  //TODO: put your app routes here

  static const String splashScreen = '/splashScreen',
      loginScreen = '/loginScreen';

  static List<GetPage> setScreens() {
    return <GetPage>[
      GetPage(name: splashScreen, page: () => SplashScreen()),
      GetPage(name: loginScreen, page: () => LoginScreen()),
    ];
  }
}
