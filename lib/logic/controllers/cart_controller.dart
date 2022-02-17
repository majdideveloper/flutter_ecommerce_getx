import 'package:flutter_ecommerce_getx/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var productsMapCart = {}.obs;

  void addProductToCart(ProductModel productModel) {
    if (productsMapCart.containsKey(productModel)) {
      productsMapCart[productModel] += 1;
    } else {
      productsMapCart[productModel] = 1;
    }
  }

  void removeProductsFromCart(ProductModel productModel) {
    if (productsMapCart.containsKey(productModel) &&
        productsMapCart[productModel] >= 2) {
      productsMapCart[productModel] -= 1;
    } else {
      productsMapCart.remove(productModel);
    }
  }

  void removeOneProduct(ProductModel productModel) {
    productsMapCart.remove(productModel);
  }

  void clearAllProducts() {
    productsMapCart.clear();
  }

  get productSubTotal =>
      productsMapCart.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMapCart.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMapCart.isEmpty) {
      return 0;
    } else {
      return productsMapCart.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
