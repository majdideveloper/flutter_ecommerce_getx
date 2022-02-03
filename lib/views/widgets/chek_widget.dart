import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/auth_controller.dart';
import 'package:get/get.dart';

class ChekWidget extends StatelessWidget {
  ChekWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return InkWell(
          onTap: () {
            controller.checkBox();
          },
          child: Container(
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: controller.isChekBox
                ? Image.asset('assets/images/check.png')
                : null,
          ),
        );
      },
    );
  }
}
