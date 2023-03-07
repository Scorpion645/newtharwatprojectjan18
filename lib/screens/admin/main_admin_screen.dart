import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/signup_button.dart';
import 'Add_Product_Screen.dart';
import 'Manage_product_screen.dart';

class MainAdminScreen extends StatelessWidget {
  static String id = 'main admin screen';
  const MainAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        children: [
          SizedBox(
            height: 200,
          ),
          SignupButton(
            buttonTitle: 'Add Product',
            onClick: () {
              Navigator.pushNamed(context, AddProductScreen.id);
            },
          ),
          SizedBox(
            height: 20,
          ),
          SignupButton(
            buttonTitle: 'Edit Product',
            onClick: () {
              Navigator.pushNamed(context, ManageProductScreen.id);
            },
          ),
          SizedBox(
            height: 20,
          ),
          SignupButton(buttonTitle: 'Review Orders'),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
