import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import 'add_product.dart';

class AdminScreen extends StatelessWidget {
  static String id = 'admin screen';
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: double.infinity,),
      TextButton(onPressed: (){
        Navigator.popAndPushNamed(context, AddProduct.id);
      }, child: Text('Add product')),
      TextButton(onPressed: () {}, child: Text('Edit product')),
      TextButton(onPressed: () {}, child: Text('view orders')),
    ],),
    );
  }
}
