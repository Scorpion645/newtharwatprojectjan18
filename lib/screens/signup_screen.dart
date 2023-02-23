import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/custom_row.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  static String id = 'Signup screen';
  late String _email, _password, _name;
  GlobalKey<FormState> _globalKey = GlobalKey();

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
                myHint: 'Enter your name',
                myIcon: Icons.email,
                onClick: (value) {
                  // if (_globalKey.currentState!.validate()) {
                  //   _name = value!;
                  //   print('Good Job!');
                  // }
                  // print('Data is missing');
                }),
            SizedBox(
              height: 20,
            ),
            Custom_TextField(
              myHint: 'Enter your Email',
              myIcon: Icons.lock,
              onClick: (value) {
                _email = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Custom_TextField(
              myHint: 'Confirm your password',
              myIcon: Icons.lock,
              onClick: (value) {
                _password = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 140),
              child: Custom_Button(
                myButText: 'Log in',
                onClick: () {
                    _globalKey.currentState!.save();
                  
                },
              ),
            ),
            Custom_Row(
              firstText: 'Already have an account?',
              secondText: 'Log in',
              onClick: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
