import 'package:flutter_ecommerce_getx/models/category_model.dart';

import 'package:flutter_ecommerce_getx/utils/my_string.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class CategoryService {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }

  static Future<List<ProductModel>> getProductFromCategory(
      String nameCategory) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/${nameCategory}'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }
}
