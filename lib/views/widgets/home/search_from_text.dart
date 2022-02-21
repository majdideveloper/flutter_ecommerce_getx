import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/product_controller.dart';
import 'package:get/get.dart';

class SearchFromText extends StatelessWidget {
  SearchFromText({Key? key}) : super(key: key);

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        builder: (_) => TextField(
              onChanged: ((value) {
                controller.addSearchToList(value);
              }),
              style: const TextStyle(color: Colors.black),
              controller: controller.searchController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Search with name & price",
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
                suffixIcon: controller.searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          controller.clearSearch();
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 32,
                          color: Colors.black,
                        ))
                    : null,
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
            ));
  }
}
