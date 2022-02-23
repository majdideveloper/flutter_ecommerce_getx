import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/theme_controller.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/settings/icon_widget.dart';
import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';

import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this line is very important to change bertween themes
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: mainColor,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtils(
            text: 'General'.toUpperCase(),
            color: mainColor,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 30,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 30,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
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
            },
            child: IconWidget(
                text: 'Log Out',
                icon: Icons.logout,
                backgroundIcon: logOutSettings),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
