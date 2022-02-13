import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/theme_controller.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';

import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this line is very important to change bertween themes
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            child: Text(
              'Dark mode',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            onPressed: ThemeController().switchTheme,
          ),
          GetBuilder<AuthController>(builder: (controller) {
            return TextButton(
              child: Text(
                'log out',
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onPressed: () {
                Get.defaultDialog(
                    title: 'Logout From App',
                    titleStyle: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    middleText: 'are you sure to logOut ',
                    middleTextStyle: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    backgroundColor: Colors.grey[900],
                    radius: 10.0,
                    textCancel: 'No',
                    buttonColor: mainColor,
                    cancelTextColor: Colors.white,
                    textConfirm: 'Yes',
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      controller.signOutFromApp();
                    });

                //controller.signOutFromApp();
              },
            );
          })
        ],
      ),
    );
  }
}
