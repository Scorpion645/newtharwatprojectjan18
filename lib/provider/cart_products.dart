import 'package:flutter/material.dart';

class CartProducts extends ChangeNotifier {
  int totalCost = 0;
  Map<dynamic, int> cartProducts = {};
  calculateCost(context) {
     totalCost = 0;
    if (cartProducts.isNotEmpty) {
      for (var item in cartProducts.entries) {
        totalCost += int.parse(item.key['PRICE']) * item.value.toInt();
    }
    }
  }
  notifyListeners();
}
