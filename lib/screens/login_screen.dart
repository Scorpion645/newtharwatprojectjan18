import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_Row.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/logo.dart';
import '../widgets/sizedbox.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'log in screen';
   LoginScreen({Key? key}) : super(key: key);
    GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            heightSizedbox(60),
            Logo(),
            heightSizedbox(20),
            CustomTextField(
              myIcon: Icons.email,
              myHint: 'Enter your Email',
            ),
            heightSizedbox(20),
            CustomTextField(
              myIcon: Icons.lock,
              myHint: 'Enter your Password',
              myObscured: true,
            ),
            heightSizedbox(99),
            CustomButton(
              butTitle: 'Log in',
              onClick: () {
                _globalKey.currentState!.validate();
              },
            ),
            CustomRow(
              firstText: 'Already have an account?',
              secondText: 'Signup',
              onclick: () {
                Navigator.pushNamed(context, SignUpScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
