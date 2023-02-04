import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/Custom_Row.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/logo.dart';
import '../widgets/signup_button.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'sign up screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainColor,
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Logo(),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              myHint: 'Enter your Name',
              myIcon: Icons.person,
              myKeyboard: TextInputType.name,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              myHint: 'Enter your Email',
              myIcon: Icons.email,
              myKeyboard: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              myHint: 'Enter your Password',
              myIcon: Icons.lock,
              myKeyboard: TextInputType.visiblePassword,
              myObscuredText: true,
            ),
            SizedBox(
              height: 30,
            ),
            SignupButton(
              buttonTitle: 'Sign up',
            ),
            SizedBox(
              height: 30,
            ),
            CustomRow(
                firstRowText: 'Already have an account?',
                secondRowText: 'Log in',
                onClick: () {
                  Navigator.popAndPushNamed(context, LoginScreen.id);
                }),
          ],
        ));
  }
}
