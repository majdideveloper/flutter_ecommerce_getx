import 'package:flutter_ecommerce_getx/logic/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../controllers/payment_contoller.dart';
import '../controllers/settings_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SettingsController());
    Get.put(PaymentController(), permanent: true);
  }
}
