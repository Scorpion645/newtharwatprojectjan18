import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/customButton.dart';
import 'AddProduct_screen.dart';

class AdminHome extends StatelessWidget {
  static String id = 'Admin home';
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        children: [
          SizedBox(
            height: 120,
          ),
          CustomButton(
              buttonTitle: 'Add Produt',
              onClick: () {
                Navigator.popAndPushNamed(context, AddProductScreen.id);
              }),
          SizedBox(
            height: 10,
          ),
          CustomButton(buttonTitle: 'Edit Produt', onClick: () {}),
          SizedBox(
            height: 10,
          ),
          CustomButton(buttonTitle: 'View Orders', onClick: () {}),
        ],
      ),
    );
  }
}
