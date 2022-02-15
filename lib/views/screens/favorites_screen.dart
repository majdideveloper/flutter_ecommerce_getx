import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/product_controller.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Obx(
          () => controller.productFavoirteList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/heart.png'),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'please add your favorites products ...',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      )
                    ],
                  ),
                )
              : ListView.separated(
                  itemBuilder: ((context, index) {
                    return _buildFavoriteItem(index);
                  }),
                  separatorBuilder: ((context, index) {
                    return const Divider(
                      color: mainColor,
                      thickness: 1,
                    );
                  }),
                  itemCount: controller.productFavoirteList.length),
        ));
  }

  Widget _buildFavoriteItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    controller.productFavoirteList[index].image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.productFavoirteList[index].title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    ' \$ ${controller.productFavoirteList[index].price}',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                controller.removeFavoriteProduct(
                    controller.productFavoirteList[index].id);
              },
              icon: const Icon(
                Icons.favorite,
                color: mainColor,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
