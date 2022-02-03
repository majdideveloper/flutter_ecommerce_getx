import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/routes/routes.dart';

import 'package:flutter_ecommerce_getx/utils/themes.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ecommere shop',
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      initialRoute: AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
