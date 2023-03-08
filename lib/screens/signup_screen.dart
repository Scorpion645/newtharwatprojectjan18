import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/Custom_row.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/logo.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'sign up screen';
  SignUpScreen({Key? key}) : super(key: key);
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
            myIcon: Icons.person,
            myHint: 'Enter your Name',
          ),
          SizedBox(
            height: 10,
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
            height: 20,
          ),
          CustomButton(butTitle: 'Sign up',onClick: () {
            _globalKey.currentState!.validate();
          },),
          SizedBox(
            height: 10,
          ),
          CustomRow(
              firstText: 'Already have an accunt?',
              secText: 'Log in',
              onClick: (() {
                
                Navigator.pushNamed(context, LoginScreen.id);
              })),
        ]),
      ),
    );
  }
}
