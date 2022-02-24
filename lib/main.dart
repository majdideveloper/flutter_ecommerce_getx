import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/language/localiztion.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/theme_controller.dart';
import 'package:flutter_ecommerce_getx/routes/routes.dart';

import 'package:flutter_ecommerce_getx/utils/themes.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'utils/my_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ecommere shop',
      // this next three line about how to change language with getx
      locale: Locale(GetStorage().read<String>('lang').toString()),
      fallbackLocale: Locale(eng),
      translations: LocaliztionApp(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeController().theme,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read('auth') == true
          ? AppRoutes.mainScreen
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
