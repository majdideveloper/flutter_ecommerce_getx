import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/views/widgets/auth/auth_button.dart';
import 'package:flutter_ecommerce_getx/views/widgets/text_utils.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              TextUtils(
                text: 'Total',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              TextUtils(
                text: '\$ 600',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: AuthButton(
              text: 'Check Out',
              onPressed: () {},
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
