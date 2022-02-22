import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/settings_controller.dart';
import 'package:flutter_ecommerce_getx/views/widgets/settings/icon_widget.dart';
import 'package:flutter_ecommerce_getx/views/widgets/text_utils.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/theme_controller.dart';
import '../../../utils/themes.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);

  final controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconWidget(
          text: 'Dark Mode',
          icon: Icons.dark_mode,
          backgroundIcon: darkSettings,
        ),
        Obx(
          () => Switch(
              activeTrackColor: mainColor,
              activeColor: mainColor,
              value: controller.isDarkMode.value,
              onChanged: (changeBool) {
                controller.isDarkMode.value = changeBool;
                ThemeController().switchTheme();
              }),
        )
      ],
    );
  }
}
