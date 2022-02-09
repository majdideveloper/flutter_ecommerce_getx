import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/main_controller.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
            appBar: AppBar(
              centerTitle: true,
              elevation: 0.0,
              title: Text(
                'xiv shop'.toUpperCase(),
              ),
              backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/shop.png',
                  ),
                ),
              ],
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.screens.value,
            ), //controller.screens[controller.currentIndex.value],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                controller.currentIndex.value = index;
              },
              items: [
                BottomNavigationBarItem(
                    activeIcon: const Icon(
                      Icons.home,
                      color: mainColor,
                    ),
                    icon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: const Icon(
                      Icons.category,
                      color: mainColor,
                    ),
                    icon: Icon(
                      Icons.category,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: const Icon(
                      Icons.favorite,
                      color: mainColor,
                    ),
                    icon: Icon(
                      Icons.favorite,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: const Icon(
                      Icons.settings,
                      color: mainColor,
                    ),
                    icon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                    label: ''),
              ],
            ),
          );
        },
      ),
    );
  }
}
