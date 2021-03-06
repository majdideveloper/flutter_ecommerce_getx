import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/models/user_facebook_model.dart';
import 'package:flutter_ecommerce_getx/routes/routes.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibilty = true;

  // save name of user in firebase
  var displayUserName = ''.obs;
  var displayUserImage = ''.obs;
  var displayUserEmail = ''.obs;
  // this line for getstorage to save user key
  final authBox = GetStorage();
  var isSignIn = false;

  bool isChekBox = false;

  //

  FirebaseAuth auth = FirebaseAuth.instance;

  FaceBookModel? faceBookModel;

  var googleSignIn = GoogleSignIn();

  //
  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    displayUserName.value =
        (userProfile != null ? userProfile!.displayName : '')!;
    displayUserEmail.value = (userProfile != null ? userProfile!.email : '')!;
    displayUserImage.value =
        (userProfile != null ? userProfile!.photoURL : '')!;

    super.onInit();
  }

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
        displayUserName.value = name;
        auth.currentUser!.updateDisplayName(displayUserName.value);
      });
      isSignIn = true;
      authBox.write('auth', isSignIn);

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
        displayUserName.value = auth.currentUser!.displayName!;
      });
      isSignIn = true;
      authBox.write('auth', isSignIn);
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

  void googleSingUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName.value = googleUser!.displayName!;
      displayUserImage.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;

      // this code about take token from google authentication
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await auth.signInWithCredential(credential);

      isSignIn = true;
      authBox.write('auth', isSignIn);
      update();
      Get.offNamed(Routes.mainScreen);
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

  void facebookSingUpApp() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    if (loginResult.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      faceBookModel = FaceBookModel.fromJson(data);
      isSignIn = true;
      authBox.write('auth', isSignIn);
      update();

      Get.offNamed(Routes.mainScreen);
    } else {
      print('================errorr====================');
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
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

  void signOutFromApp() async {
    try {
      await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();
      await FacebookAuth.instance.logOut();
      displayUserImage.value = '';
      displayUserName.value = '';
      displayUserEmail.value = '';
      isSignIn = false;
      authBox.remove('auth');
      update();

      Get.offNamed(Routes.welcomeScreen);
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
}
