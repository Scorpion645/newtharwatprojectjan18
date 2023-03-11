import 'package:flutter/material.dart';

class CartItem extends ChangeNotifier {
  List products = [];

  addProduct(dynamic product) {
    products.add(product);
    notifyListeners();
  }
}
