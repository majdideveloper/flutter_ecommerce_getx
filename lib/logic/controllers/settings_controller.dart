import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/my_string.dart';

class SettingsController extends GetxController {
  var isDarkMode = true.obs;

  var storage = GetStorage();
  var languageLocal = eng;

  @override
  void onInit() async {
    super.onInit();

    languageLocal = await getLanguage;
  }

  // language

  void saveLanguage(String lang) async {
    await storage.write('lang', lang);
  }

  Future<String> get getLanguage async {
    return await storage.read('lang');
  }

  void changeLanguage(String typeLang) {
    if (languageLocal == typeLang) {
      return;
    }

    if (typeLang == fre) {
      languageLocal = fre;
      saveLanguage(fre);
    } else if (typeLang == ara) {
      languageLocal = ara;
      saveLanguage(ara);
    } else {
      languageLocal = eng;
      saveLanguage(eng);
    }

    update();
  }
}
