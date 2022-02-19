import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/product_controller.dart';
import 'package:flutter_ecommerce_getx/models/product_model.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/screens/products_details_screen.dart';
import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';
import 'package:get/get.dart';

import '../../../logic/controllers/cart_controller.dart';

class CardItem extends StatelessWidget {
  CardItem({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const CircularProgressIndicator(
          color: mainColor,
        );
      } else {
        return Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.6,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,
            ),
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
              return _buildCardItem(
                  product: controller.productList[index],
                  index: index,
                  onTap: () {
                    Get.to(
                      () => ProductsDetailsScreen(
                        productModel: controller.productList[index],
                      ),
                    );
                  }
                  // image: controller.productList[index].image,
                  // price: controller.productList[index].price,
                  // rate: controller.productList[index].rating.rate,
                  );
            },
          ),
        );
      }
    });
  }

  Widget _buildCardItem({
    required ProductModel product,
    required int index,
    required Function() onTap,
    // required String image,
    // required double price,
    // required double rate,
  }) {
    return Padding(
      padding: const EdgeInsets.all(
        5.0,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (controller.isFavourites(product.id)) {
                          controller.removeFavoriteProduct(product.id);
                        } else {
                          controller.addFavoriteProduct(product.id);
                        }

                        // if (product.id == controller.productList[index].id) {
                        //   controller.removeFavoriteProduct(product.id);
                        // }
                      },
                      icon: controller.isFavourites(product.id)
                          ? const Icon(
                              Icons.favorite,
                              color: mainColor,
                            )
                          : const Icon(
                              Icons.favorite_outline_outlined,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(product);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Image.network(
                  product.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${product.price}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 3,
                          right: 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              text: '${product.rating.rate}',
                              fontSize: 13,
                            ),
                            const Icon(
                              Icons.star,
                              size: 14,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
