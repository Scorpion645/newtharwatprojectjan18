import 'package:flutter/material.dart';

class CartItem extends ChangeNotifier {
  Map<dynamic, int> products = {};

  int totalPrice = 0;
  int totalCoast = 0;

  addProduct(dynamic product, int count) {
    products.addEntries([MapEntry(product, count)]);
    totalPrice += int.parse(product['PRICE']) * count.round();
    notifyListeners();
  }

  removeProduct(dynamic product, int count) {
    totalPrice -= int.parse(product['PRICE']) * count.round();
    notifyListeners();
  }
}
