import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/custom_Button.dart';

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
          CustomButton(butTitle: 'Add product'),
          SizedBox(
            height: 20,
          ),
          CustomButton(butTitle: 'Edit product'),
          SizedBox(
            height: 20,
          ),
          CustomButton(butTitle: 'Order review'),
        ],
      ),
    );
  }
}
