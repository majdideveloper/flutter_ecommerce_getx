import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/routes/routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisibilty = true;
  var lista = <int>[];

  // save name of user in firebase
  String displayUserName = '';

  bool isChekBox = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  void visibility() {
    isVisibilty = !isVisibilty;
    update();
  }

  void checkBox() {
    isChekBox = !isChekBox;
    update();
  }

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String passWord,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: passWord)
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(displayUserName);
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = error.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
  }

  void logInUsingFirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName = auth.currentUser!.displayName!;
      });
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
    }
  }

  void googleSingUpApp() {}
  void facebookSingUpApp() {}

  void resetPassword() {}

  void signOutFromApp() {}
}
