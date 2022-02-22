import 'package:flutter_ecommerce_getx/models/product_model.dart';
import 'package:flutter_ecommerce_getx/services/category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryNameList = [].obs;
  var isLoading = true.obs;

  var categoryImageList = [
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ].obs;

  //
  var produitFromCategory = <ProductModel>[].obs;
  var isLoadingProductFromCategory = true.obs;

  @override
  void onInit() {
    getCategory();
    super.onInit();
  }

  void getCategory() async {
    var category = await CategoryService.getCategory();

    try {
      isLoading(true);
      if (category.isNotEmpty) {
        categoryNameList.addAll(category);
      }
    } finally {
      isLoading(false);
    }
  }

  getProductfromCategory(String nameCategory) async {
    isLoadingProductFromCategory(true);
    produitFromCategory.value =
        await CategoryService.getProductFromCategory(nameCategory);

    isLoadingProductFromCategory(false);
  }
}
