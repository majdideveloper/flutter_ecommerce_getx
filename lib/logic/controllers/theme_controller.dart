import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  String keyStorage = 'isDarkModes';

  saveThemeDataInBox(bool isDark) {
    boxStorage.write(keyStorage, isDark);
  }

  bool getThemeDataInBox() {
    return boxStorage.read<bool>(keyStorage) ?? false;
  }

  ThemeMode get themeChange =>
      getThemeDataInBox() ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    Get.changeThemeMode(getThemeDataInBox() ? ThemeMode.dark : ThemeMode.light);
    saveThemeDataInBox(getThemeDataInBox());

    // Get.isDarkMode
    //     ? Get.changeThemeMode(ThemeMode.light)
    //     : Get.changeThemeMode(ThemeMode.dark);
  }
}
