import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisibilty = true;

  bool isChekBox = false;

  void visibility() {
    isVisibilty = !isVisibilty;
    update();
  }

  void checkBox() {
    isChekBox = !isChekBox;
    update();
  }
}
