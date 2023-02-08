import 'package:flutter/material.dart';

class IAmAdmin extends ChangeNotifier {
  bool iAmAdmin = true;

  ChangeiAmAdmin(bool value) {
    iAmAdmin = value;
    notifyListeners();
  }
}
