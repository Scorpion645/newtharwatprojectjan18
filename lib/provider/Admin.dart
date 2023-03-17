import 'package:flutter/material.dart';

class AdminUser extends ChangeNotifier {
  bool isAdmin = false;

  ChangeAdmin(bool value) {
    isAdmin = value;
    notifyListeners();
  }
}
