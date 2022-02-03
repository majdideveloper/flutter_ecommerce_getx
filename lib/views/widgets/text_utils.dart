import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtils extends StatelessWidget {
  final String text;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  TextDecoration? underline;
  TextAlign? textAlign;

  TextUtils({
    required this.text,
    this.fontSize = 35.0,
    this.fontWeight,
    this.color = Colors.white,
    this.underline,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          decoration: underline,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
