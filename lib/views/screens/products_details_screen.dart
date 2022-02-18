import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/models/product_model.dart';
import 'package:get/get.dart';

import '../widgets/widgets.dart';

class ProductsDetailsScreen extends StatelessWidget {
  final ProductModel productModel;
  const ProductsDetailsScreen({Key? key, required this.productModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                urlImage: productModel.image,
              ),
              // ClothesInfo(),
              // SizeList(),
              // AddCart(),
            ],
          ),
        ),
      ),
    );
  }
}
