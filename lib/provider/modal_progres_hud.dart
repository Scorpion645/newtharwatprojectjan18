import 'package:flutter/material.dart';

class ModalProgressHud extends ChangeNotifier {
  bool isLoading = false;

  ChangeIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
