import 'package:flutter/material.dart';

class ModalHud extends ChangeNotifier {
  bool isLoading = false;

  ChangeIsLoading(value) {
    isLoading = value;
    notifyListeners();
  }
}
