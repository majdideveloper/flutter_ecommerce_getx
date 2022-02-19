import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/widgets.dart';

class AuthButton extends StatelessWidget {
  final String text;
  double horizontalPadding;
  double? fontSize;
  void Function()? onPressed;
  AuthButton({
    Key? key,
    this.horizontalPadding = 10,
    required this.text,
    required this.onPressed,
    this.fontSize = 35.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 10.0,
          )),
      onPressed: onPressed,
      child: TextUtils(
        text: text,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
