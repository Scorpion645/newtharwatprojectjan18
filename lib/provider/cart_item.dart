import 'package:flutter/material.dart';

class CartItem extends ChangeNotifier {
  Map<dynamic, int> products = {};

  addProduct(dynamic product, int count) {
    products.addEntries([MapEntry (product, count)]);
    notifyListeners();
  }
}
