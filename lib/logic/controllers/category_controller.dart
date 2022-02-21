import 'package:flutter_ecommerce_getx/services/category_service.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  var categoryNameList = [].obs;
  var isLoading = true.obs;

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
}
