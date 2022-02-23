import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';
import 'package:get/get.dart';

class IconWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundIcon;
  IconWidget(
      {Key? key,
      required this.text,
      required this.icon,
      required this.backgroundIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(
        backgroundColor: backgroundIcon,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      TextUtils(
        text: text,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
    ]);
  }
}
