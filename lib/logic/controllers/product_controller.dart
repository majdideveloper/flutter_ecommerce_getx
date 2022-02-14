import 'package:flutter_ecommerce_getx/models/product_model.dart';
import 'package:flutter_ecommerce_getx/services/product_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    var products = await ProductService.getProduct();

    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
