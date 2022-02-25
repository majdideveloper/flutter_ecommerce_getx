import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text('Payment Screen'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(
              text: 'Shipping To',
              fontSize: 24,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 20,
            ),
            DeliveryContainerWidget(),
            const SizedBox(
              height: 20,
            ),
            TextUtils(
              text: 'Payment Method',
              fontSize: 24,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 20,
            ),
            PaymentMethodWidget(),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: AuthButton(
                text: 'Pay Now',
                onPressed: () {},
                fontSize: 24,
                horizontalPadding: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
