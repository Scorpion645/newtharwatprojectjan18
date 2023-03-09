import 'package:flutter/material.dart';

class AdminMode extends ChangeNotifier {
  bool isAdmin = false;

  ChangeIsAdmin(bool value) {
    isAdmin = value;
    notifyListeners();
  }
}
