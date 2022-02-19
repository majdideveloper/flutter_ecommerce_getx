import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_getx/routes/routes.dart';
import 'package:flutter_ecommerce_getx/utils/config.dart';
import 'package:flutter_ecommerce_getx/utils/my_string.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';

import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
// ! this linge to declartion key of form like that
  final keyForm = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
// ! this line important!!!
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: SizeConfig.screenHeight / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                    top: 20.0,
                  ),
                  child: Form(
                    key: keyForm,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'sign'.toUpperCase(),
                              fontWeight: FontWeight.w700,
                              color: mainColor,
                              fontSize: 28.0,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            TextUtils(
                              text: 'up'.toUpperCase(),
                              fontWeight: FontWeight.w700,
                              color:
                                  Get.isDarkMode ? Colors.white : darkGreyClr,
                              fontSize: 28.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50.0,
                        ),
                        AuthTextFromField(
                          controller: nameController,
                          validator: (value) {
                            if (value.toString().length <= 4 ||
                                !RegExp(validationName).hasMatch(value!)) {
                              return 'Enter valid Name';
                            }
                          },
                          prefixIcon: Image.asset('assets/images/user.png'),
                          hintText: 'User Name',
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        AuthTextFromField(
                          controller: emailController,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value!)) {
                              return 'Enter valid Email';
                            }
                          },
                          prefixIcon: Image.asset('assets/images/email.png'),
                          hintText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFromField(
                              controller: passwordController,
                              obscureText:
                                  controller.isVisibilty ? true : false,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 caracters';
                                }
                              },
                              prefixIcon: Image.asset('assets/images/lock.png'),
                              hintText: 'PassWord',
                              keyboardType: TextInputType.visiblePassword,
                              suffixIcon: IconButton(
                                icon: controller.isVisibilty
                                    ? const Icon(
                                        Icons.visibility,
                                        color: mainColor,
                                      )
                                    : const Icon(
                                        Icons.visibility_off,
                                        color: mainColor,
                                      ),
                                onPressed: () {
                                  controller.visibility();
                                },
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            ChekWidget(),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Row(
                              children: [
                                TextUtils(
                                  text: 'I accept',
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : darkGreyClr,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                SizedBox(
                                  child: FittedBox(
                                    child: TextUtils(
                                      text: 'Terms & conditions',
                                      color: Get.isDarkMode
                                          ? Colors.white
                                          : darkGreyClr,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                      underline: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            horizontalPadding: 50,
                            text: 'sign up'.toUpperCase(),
                            onPressed: () {
                              if (controller.isChekBox == false) {
                                Get.snackbar(
                                  'Check Box',
                                  'Please, Accept terms & conditions ',
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: Colors.orange,
                                  colorText: Colors.white,
                                );
                              } else if (keyForm.currentState!.validate()) {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.signUpUsingFirebase(
                                    name: name,
                                    email: email,
                                    passWord: password);
                              }
                            },
                            fontSize: 20.0,
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
              BottomContainer(
                text: 'Already have an Account?',
                textDirection: 'Log in',
                onPressed: () {
                  Get.toNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
