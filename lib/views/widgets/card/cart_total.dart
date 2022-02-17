import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/views/widgets/auth/auth_button.dart';
import 'package:flutter_ecommerce_getx/views/widgets/text_utils.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  final double total;
  const CartTotal({Key? key, this.total = 0}) : super(key: key);

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
              Text(
                '\$ $total',
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
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
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
