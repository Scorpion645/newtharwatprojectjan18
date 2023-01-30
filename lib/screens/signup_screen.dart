import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_logo.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'sign up screen';
  //  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainColor,
        body: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomLogo()
          ],
        ));
  }
}


