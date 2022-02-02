import 'package:flutter/material.dart';

class ChekWidget extends StatelessWidget {
  const ChekWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 35.0,
        width: 35.0,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.asset('assets/images/check.png'),
      ),
    );
  }
}
