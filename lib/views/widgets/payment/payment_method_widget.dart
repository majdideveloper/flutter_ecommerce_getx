import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/auth_controller.dart';
import '../../../logic/controllers/payment_contoller.dart';
import '../../../utils/themes.dart';

class PaymentMethodWidget extends StatelessWidget {
  PaymentMethodWidget({Key? key}) : super(key: key);
  final controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          PaymentWidget(
              image: 'assets/images/paypal.png',
              text: 'PayPAl',
              value: 1,
              onChanged: (value) {
                controller.onChangeItemRadioPayment(1);
              }),
          const SizedBox(
            height: 10,
          ),
          PaymentWidget(
              image: 'assets/images/google.png',
              text: 'Google Pay',
              value: 2,
              onChanged: (value) {
                controller.onChangeItemRadioPayment(2);
              }),
          const SizedBox(
            height: 10,
          ),
          PaymentWidget(
              image: 'assets/images/credit.png',
              text: 'Master Card',
              value: 3,
              onChanged: (value) {
                controller.onChangeItemRadioPayment(3);
              }),
        ],
      ),
    );
  }

  Widget PaymentWidget({
    required String image,
    required String text,
    required int value,
    required Function(int?)? onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Radio(
            value: value,
            groupValue: controller.radioPaymentIndex.value,
            onChanged: onChanged,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
          ),
        ],
      ),
    );
  }
}
