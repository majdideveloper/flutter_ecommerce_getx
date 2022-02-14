import 'package:flutter_ecommerce_getx/models/product_model.dart';
import 'package:flutter_ecommerce_getx/utils/my_string.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<ProductModel>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }
}
// https://fakestoreapi.com/products