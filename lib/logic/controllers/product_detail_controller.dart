import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  var currentPage = 0.obs;
  var currentColor = 0.obs;
  var currentSize = 0.obs;
  var listColor = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ].obs;
  final List<String> sizeList = [
    's',
    'm',
    'l',
    'xl',
    'xxl',
  ].obs;
}
