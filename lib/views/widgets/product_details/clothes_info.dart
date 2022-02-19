import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/product_controller.dart';
import 'package:flutter_ecommerce_getx/models/product_model.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final ProductModel productModel;

  ClothesInfo({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  productModel.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
              Obx(
                (() => Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: controller.isFavourites(productModel.id)
                        ? IconButton(
                            icon: const Icon(
                              Icons.favorite,
                              color: mainColor,
                            ),
                            onPressed: () {
                              controller.removeFavoriteProduct(productModel.id);
                            },
                          )
                        : IconButton(
                            padding: const EdgeInsets.all(2),
                            icon: const Icon(
                              Icons.favorite_outline,
                              color: mainColor,
                            ),
                            onPressed: () {
                              controller.addFavoriteProduct(productModel.id);
                            },
                          ))),
              ),
            ],
          ),
          Row(
            children: [
              RatingBarIndicator(
                rating: productModel.rating.rate,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                text: productModel.rating.rate.toString(),
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ReadMoreText(
            productModel.description,
            trimLines: 3,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            colorClickableText: mainColor,
            style: TextStyle(
              fontSize: 18,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
