import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/product_detail_controller.dart';

class SizeList extends StatelessWidget {
  SizeList({Key? key}) : super(key: key);

  final controller = Get.find<ProductDetailController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Obx(
              () => GestureDetector(
                onTap: () {
                  controller.currentSize.value = index;
                },
                child: Container(
                  child: Text(
                    controller.sizeList[index].toUpperCase(),
                    style: const TextStyle(color: Colors.black),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  decoration: BoxDecoration(
                    color: controller.currentSize.value == index
                        ? mainColor
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.4),
                      width: 2,
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 5,
            );
          },
          itemCount: controller.sizeList.length),
    );
  }
}
