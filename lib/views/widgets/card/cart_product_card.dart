import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: NetworkImage(
                    'https://images.unsplash.com/photo-1640622658799-54e6039d189b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'title',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'title',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_circle),
                  ),
                  const Text(
                    '1',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_circle),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
