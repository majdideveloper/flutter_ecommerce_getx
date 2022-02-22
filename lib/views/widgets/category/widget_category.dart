import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/category_controller.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/category/category_items.dart';
import 'package:get/get.dart';

class WidgetCategory extends StatelessWidget {
  WidgetCategory({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      } else {
        return ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: ((context, index) {
              return InkWell(
                onTap: () {
                  controller.getProductfromCategory(
                      controller.categoryNameList[index]);
                  Get.to(() => CategoryItems(
                        index: index,
                      ));
                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 10,
                    ),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        controller.categoryNameList[index],
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: mainColor),
                      ),
                    ),
                  ),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        controller.categoryImageList[index],
                      ),
                    ),
                  ),
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return const SizedBox(
                height: 10,
              );
            }),
            itemCount: controller.categoryNameList.length);
      }
    });
  }
}
