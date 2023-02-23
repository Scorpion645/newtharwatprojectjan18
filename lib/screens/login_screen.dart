import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/custom_row.dart';
import 'Signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'sign up screen';
  GlobalKey<FormState> _globalKey = GlobalKey();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 26),
                    child: Image.asset('assets/images/icons8-buy-100.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Text('Buy it',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'pacifico')),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Custom_TextField(
              myHint: 'Enter your Email',
              myIcon: Icons.email,
            ),
            SizedBox(
              height: 20,
            ),
            Custom_TextField(
              myHint: 'Enter your password',
              myIcon: Icons.lock,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140),
              child: Custom_Button(
                myButText: 'Log in',
                onClick: () {},
              ),
            ),
            Custom_Row(
              firstText: 'Do NOT have an account yet?',
              secondText: 'Sign up',
              onClick: () {
                Navigator.pushNamed(context, SignupScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
