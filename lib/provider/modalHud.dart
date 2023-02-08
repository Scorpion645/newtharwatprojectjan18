import 'package:flutter/material.dart';

class ModalHud extends ChangeNotifier {
  var isLoading = false;

  changeisLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
