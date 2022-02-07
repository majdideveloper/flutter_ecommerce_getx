import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_getx/routes/routes.dart';
import 'package:flutter_ecommerce_getx/utils/config.dart';
import 'package:flutter_ecommerce_getx/utils/my_string.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
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
                  top: 40.0,
                ),
                child: Form(
                  key: keyForm,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextUtils(
                            text: 'log'.toUpperCase(),
                            fontWeight: FontWeight.w700,
                            color: mainColor,
                            fontSize: 28.0,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          TextUtils(
                            text: 'in'.toUpperCase(),
                            fontWeight: FontWeight.w700,
                            color: Get.isDarkMode ? darkGreyClr : Colors.white,
                            fontSize: 28.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
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
                            obscureText: controller.isVisibilty ? true : false,
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
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.forgetPasswordScreen);
                          },
                          child: TextUtils(
                            text: 'Forget Password ?',
                            fontSize: 16,
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                          ),
                        ),
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
                                text: 'Remember me',
                                color:
                                    Get.isDarkMode ? darkGreyClr : Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(
                                width: 5.0,
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
                          text: 'log in'.toUpperCase(),
                          onPressed: () {
                            if (keyForm.currentState!.validate()) {
                              String email = emailController.text.trim();
                              String password = passwordController.text;
                              controller.logInUsingFirebase(
                                  email: email, password: password);
                            }
                          },
                          fontSize: 20.0,
                        );
                      }),
                      const SizedBox(height: 10),
                      TextUtils(
                        text: 'or',
                        fontSize: 18,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/facebook.png',
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Image.asset('assets/images/google.png')
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            BottomContainer(
              text: "Don't have an Account?",
              textDirection: 'Sign Up',
              onPressed: () {
                Get.toNamed(Routes.signUpScreen);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
