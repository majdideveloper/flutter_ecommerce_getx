import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/routes/routes.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';
import 'package:get/get.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Your Cart is ',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text: 'Empty',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Add Items To Get Started',
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          AuthButton(
              text: 'Go to Home ',
              fontSize: 20,
              onPressed: () {
                Get.toNamed(Routes.mainScreen);
              })
        ],
      ),
    );
  }
}
