import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/views/screens/screens.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var isDarkMode = true.obs;

  RxList<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs;
}
