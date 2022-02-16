import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Cart Item'),
          elevation: 0.0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: ListView.separated(
                    itemBuilder: ((context, index) {
                      return CartProductCard();
                    }),
                    separatorBuilder: ((context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    }),
                    itemCount: 5),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: CartTotal(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
