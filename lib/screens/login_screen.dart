import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/Custom_row.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/logo.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'login screen';
  LoginScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(children: [
          SizedBox(
            height: 60,
          ),
          Logo(),
          SizedBox(
            height: 40,
          ),
          CustomTextField(
            myIcon: Icons.email,
            myHint: 'Enter your Email',
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            myIcon: Icons.lock,
            myHint: 'Enter your Password',
          ),
          SizedBox(
            height: 89,
          ),
          CustomButton(
            butTitle: 'Log in',
            onClick: () {
              _globalKey.currentState!.validate();
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomRow(
              firstText: 'Do Not have an accunt?',
              secText: 'Sign up',
              onClick: (() {
                Navigator.pushNamed(context, SignUpScreen.id);
              })),
        ]),
      ),
    );
  }
}
