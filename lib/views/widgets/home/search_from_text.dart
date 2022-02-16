import 'package:flutter/material.dart';

class SearchFromText extends StatelessWidget {
  SearchFromText({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Search you're looking for",
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w700,
        ),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: const Icon(
          Icons.search,
          size: 32,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
