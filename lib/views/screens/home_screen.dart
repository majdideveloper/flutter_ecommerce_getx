import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/utils/config.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            width: double.infinity,
            height: SizeConfig.screenHeight / 3.5,
            decoration: const BoxDecoration(
              color: mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  TextUtils(
                    text: 'Find Your',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextUtils(
                    text: 'Inspiration'.toUpperCase(),
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SearchFromText(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtils(
                text: 'Categories',
                fontSize: 24,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          CardItem(),
        ],
      ),
    );
  }
}
