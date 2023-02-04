import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/Custom_Row.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/logo.dart';
import '../widgets/signup_button.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'Login screen';
  const LoginScreen({Key? key}) : super(key: key);

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
              height: 80,
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
              buttonTitle: 'Log in',
            ),
            SizedBox(
              height: 30,
            ),
            CustomRow(
              firstRowText: 'Do Not have an account?',
              secondRowText: 'Sign up',
              onClick: () {
                Navigator.popAndPushNamed(context, SignUpScreen.id);
              },
            ),
          ],
        ));
  }
}
