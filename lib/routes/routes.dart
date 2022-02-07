import 'package:flutter_ecommerce_getx/logic/bindings/auth_binding.dart';

import 'package:flutter_ecommerce_getx/views/screens/screens.dart';

import 'package:get/route_manager.dart';

class AppRoutes {
  //initialRoute:'/welcomeScreen' ,
  //  getPages: [],
  static const welcome = Routes.welcomeScreen;

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => ForgetPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => const MainScreen(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const mainScreen = '/mainScreen';
}
