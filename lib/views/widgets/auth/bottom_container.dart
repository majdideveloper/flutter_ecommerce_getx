import 'package:flutter/material.dart';

import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/text_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomContainer extends StatelessWidget {
  final String text;
  final String textDirection;
  void Function() onPressed;
  BottomContainer({
    Key? key,
    required this.textDirection,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            text: text,
            fontSize: 18.0,
          ),
          const SizedBox(
            width: 5.0,
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(textDirection,
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
