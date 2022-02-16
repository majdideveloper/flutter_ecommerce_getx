import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/main_controller.dart';
import 'package:flutter_ecommerce_getx/routes/routes.dart';
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
            appBar: AppBar(
              centerTitle: true,
              leading: Container(),
              elevation: 0.0,
              backgroundColor: mainColor,
              title: Text(
                'xiv shop'.toUpperCase(),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.cartScreen);
                  },
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
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                controller.currentIndex.value = index;
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.category,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
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
