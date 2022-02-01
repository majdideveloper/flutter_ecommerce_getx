import 'package:flutter_ecommerce_getx/views/screens/auth/login_screen.dart';
import 'package:flutter_ecommerce_getx/views/screens/auth/signup_screen.dart';
import 'package:flutter_ecommerce_getx/views/screens/welcome_screen.dart';
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
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => const SignUpScreen(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
}
