import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/cart_item.dart';

class CartScreen extends StatelessWidget {
  static String id = 'cart screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List products = Provider.of<CartItem>(context).products;
    return Scaffold(
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                Text(products[index]['NAME'].toString()),
                Text(products[index]['PRICE'].toString()),
              ],
            );
          })),
    );
  }
}
