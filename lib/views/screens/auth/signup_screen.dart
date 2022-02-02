import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/utils/config.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';

import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                            color: Colors.black,
                            fontSize: 28.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      AuthTextFromField(
                        controller: nameController,
                        validator: (value) {},
                        prefixIcon: Image.asset('assets/images/user.png'),
                        hintText: 'User Name',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      AuthTextFromField(
                        controller: emailController,
                        validator: (value) {},
                        prefixIcon: Image.asset('assets/images/email.png'),
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      AuthTextFromField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {},
                        prefixIcon: Image.asset('assets/images/lock.png'),
                        hintText: 'PassWord',
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
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              TextUtils(
                                text: 'Terms & conditions',
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                                underline: TextDecoration.underline,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      AuthButton(
                        text: 'sign up'.toUpperCase(),
                        onPressed: () {},
                        fontSize: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
              BottomContainer(
                text: 'Already have an Account?',
                textDirection: 'Log in',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
