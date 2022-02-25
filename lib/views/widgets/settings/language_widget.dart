import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/settings_controller.dart';
import 'package:flutter_ecommerce_getx/utils/my_string.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/settings/icon_widget.dart';
import 'package:get/get.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);

  final controller = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: IconWidget(
                text: 'Language'.tr,
                icon: Icons.language,
                backgroundIcon: languageSettings),
          ),
          Container(
            width: 150,
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                iconSize: 25,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                items: [
                  DropdownMenuItem(
                    child: Text(
                      english,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    value: eng,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      french,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    value: fre,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      arabic,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    value: ara,
                  ),
                ],
                value: controller.languageLocal,
                onChanged: (value) {
                  controller.changeLanguage(value!);
                  Get.updateLocale(Locale(value));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
