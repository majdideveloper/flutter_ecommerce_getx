import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/theme_controller.dart';

import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this line is very important to change bertween themes
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: TextButton(
          child: Text(
            'Dark mode',
            style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          onPressed: () {
            ThemeController().changeTheme();
          },
        ),
      ),
    );
  }
}
