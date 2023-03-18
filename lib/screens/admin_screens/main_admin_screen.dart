import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/sizedbox.dart';
import 'add_product_screen.dart';

class MainAdminScreen extends StatelessWidget {
  static String id = 'main admin screen';
  const MainAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        children: [
          heightSizedbox(160),
          CustomButton(
              butTitle: 'Add Product',
              onClick: () {
                Navigator.pushNamed(context, AddProductScreen.id);
              }),
          heightSizedbox(40),
          CustomButton(butTitle: 'Edit Product'),
          heightSizedbox(40),
          CustomButton(butTitle: 'Orders Review'),
          heightSizedbox(40),
        ],
      ),
    );
  }
}
