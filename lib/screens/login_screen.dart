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
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
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
            butTitle: 'Sign up',
          ),
          CustomRow(
            firstText: 'Already have an account?',
            secondText: 'Login',
            onclick: () {
              Navigator.pushNamed(context, SignUpScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
