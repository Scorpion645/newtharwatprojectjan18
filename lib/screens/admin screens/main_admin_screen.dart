import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_Button.dart';
import '../admin%20screens/add_product_screen.dart';
import '../admin%20screens/manage_products_screen.dart';

class MainAdminScreen extends StatelessWidget {
  static String id = 'main Admin screen';
  const MainAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        children: [
          SizedBox(
            height: 220,
          ),
          CustomButton(butTitle: 'Add product',onClick: () {
            Navigator.pushNamed(context, AddProductScreen.id);
          },),
          SizedBox(
            height: 20,
          ),
          CustomButton(butTitle: 'Edit product',onClick: () {
            Navigator.pushNamed(context, ManageProductScreen.id);
          },),
          SizedBox(
            height: 20,
          ),
          CustomButton(butTitle: 'Order review'),
        ],
      ),
    );
  }
}
