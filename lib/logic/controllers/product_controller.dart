import 'package:flutter_ecommerce_getx/models/product_model.dart';
import 'package:flutter_ecommerce_getx/services/product_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModel>[].obs;
  var productFavoirteList = <ProductModel>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    List? reisterProductFavoirteList =
        storage.read<List>('productFavoirteList');

    if (productFavoirteList != null) {
      productFavoirteList = reisterProductFavoirteList!
          .map((e) => ProductModel.fromJson(e))
          .toList()
          .obs;
    }
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

  void addFavoriteProduct(int productId) async {
    productFavoirteList.add(
      productList.firstWhere((element) => element.id == productId),
    );
    await storage.write('productFavoirteList', productFavoirteList);
  }

  void removeFavoriteProduct(int productId) async {
    var existingIndex =
        productFavoirteList.indexWhere((element) => element.id == productId);
    productFavoirteList.removeAt(existingIndex);
    await storage.remove('productFavoirteList');
  }

  bool isFavourites(int productId) {
    return productFavoirteList.any((element) => element.id == productId);
  }
}
