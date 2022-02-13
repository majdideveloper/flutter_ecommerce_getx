import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_getx/utils/my_string.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  final TextEditingController emailController = TextEditingController();

  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        centerTitle: true,
        title: TextUtils(
          text: 'forget PassWord'.toUpperCase(),
          color: mainColor,
          fontSize: 20.0,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: mainColor,
        ),
      ),
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      body: Form(
        key: keyForm,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextUtils(
                  textAlign: TextAlign.center,
                  fontSize: 20.0,
                  text:
                      'If you want to recover your account, then please your email ID below...',
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  'assets/images/forgetpass copy.png',
                  width: 350.0,
                ),
                const SizedBox(
                  height: 10.0,
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
                GetBuilder<AuthController>(builder: (_) {
                  return AuthButton(
                      text: 'send'.toUpperCase(),
                      onPressed: () {
                        if (keyForm.currentState!.validate()) {
                          controller.resetPassword(emailController.text.trim());
                        }
                      });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
