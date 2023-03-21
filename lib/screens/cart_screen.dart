import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static String id = 'cart screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('My Title',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black)),
                leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
    );
  }
}
