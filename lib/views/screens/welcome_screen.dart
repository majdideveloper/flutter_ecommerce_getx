import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/routes/routes.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';

import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.3),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 60.0,
                        width: 190.0,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                            child: TextUtils(
                          text: 'welcome',
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60.0,
                        width: 230.0,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextUtils(
                              text: 'XIV',
                              color: mainColor,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextUtils(
                              text: 'Store',
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    children: [
                      AuthButton(
                        text: 'Get start'.toUpperCase(),
                        onPressed: () {
                          Get.offNamed(Routes.loginScreen);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtils(
                            text: "don't have Account ? ",
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.offNamed(Routes.signUpScreen);
                            },
                            child: TextUtils(
                              text: "sign-up",
                              fontSize: 18.0,
                              underline: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
