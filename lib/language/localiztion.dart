import 'package:flutter_ecommerce_getx/utils/my_string.dart';
import 'package:flutter_ecommerce_getx/language/ar.dart';
import 'package:flutter_ecommerce_getx/language/fr.dart';
import 'package:flutter_ecommerce_getx/language/en.dart';
import 'package:get/get.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        eng: en,
        ara: ar,
        fre: fr,
      };
}
