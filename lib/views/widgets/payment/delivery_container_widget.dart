import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/payment_contoller.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';

class DeliveryContainerWidget extends StatelessWidget {
  DeliveryContainerWidget({Key? key}) : super(key: key);

  final controller = Get.put(PaymentController());
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          _RadioContainer(
              color: controller.changeColors.value ? Colors.white : Colors.grey,
              value: 1,
              title: 'XIV Shop',
              name: authController.displayUserName.value,
              phone: authController.displayUserEmail.value,
              adresse: controller.address.value,
              onChanged: (value) {
                controller.onChangeItemRadio(1);
              }),
          const SizedBox(
            height: 10,
          ),
          _RadioContainer(
            onChanged: (value) {
              controller.onChangeItemRadio(2);
              controller.updatePosition();
            },
            color: controller.changeColors.value ? Colors.white : Colors.grey,
            value: 2,
            title: 'ali',
            name: 'ali',
            phone: '32322423',
            adresse: controller.address.value,
          ),
        ],
      ),
    );
  }

  Widget _RadioContainer({
    required Color color,
    required int value,
    required String title,
    required String name,
    required String phone,
    required String adresse,
    required Function(Object?)? onChanged,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: color,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: controller.radioContainerIndex.value,
            onChanged: onChanged,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: name,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: phone,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: adresse,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
