import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/cart_controller.dart';
import 'package:flutter_ecommerce_getx/models/product_model.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  final ProductModel productModel;
  final int index;
  CartProductCard({Key? key, required this.productModel, required this.index})
      : super(key: key);

  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(productModel.image), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  productModel.title,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  controller.productSubTotal[index].toStringAsFixed(2),
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(productModel);
                    },
                    icon: const Icon(Icons.add_circle),
                  ),
                  Text(
                    controller.productsMapCart.values
                        .elementAt(index)
                        .toString(),
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.removeProductsFromCart(productModel);
                    },
                    icon: const Icon(Icons.remove_circle),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModel);
                },
                icon: const Icon(
                  Icons.delete,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
