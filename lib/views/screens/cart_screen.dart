import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/cart_controller.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../../utils/themes.dart';
import '../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Cart Item'),
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: 'Delete All Product',
                      titleStyle: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      middleText: 'are you sure to delete all Products?',
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
                        controller.clearAllProducts();
                        Get.back();
                      });
                },
                icon: const Icon(Icons.backspace),
              ),
            ],
          ),
          body: Obx(
            () => controller.productsMapCart.isEmpty
                ? EmptyCard()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 600,
                          child: ListView.separated(
                              itemBuilder: ((context, index) {
                                return CartProductCard(
                                  productModel: controller.productsMapCart.keys
                                      .toList()[index],
                                  index: index,
                                );
                              }),
                              separatorBuilder: ((context, index) {
                                return const SizedBox(
                                  height: 20,
                                );
                              }),
                              itemCount: controller.productsMapCart.length),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: CartTotal(
                            total: double.parse(controller.total),
                          ),
                        ),
                      ],
                    ),
                  ),
          )),
    );
  }
}
