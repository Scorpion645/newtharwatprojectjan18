import 'package:firebase_auth/firebase_auth.dart';
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
  late String _email, _password;
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
              onClick: (value) {
                _email = value!;
              },
            ),
            heightSizedbox(20),
            CustomTextField(
              myIcon: Icons.lock,
              myHint: 'Enter your Password',
              myObscured: true,
              onClick: (value) {
                _password = value!;
              },
            ),
            heightSizedbox(99),
            CustomButton(
                butTitle: 'Log in',
                onClick: () async {
                  _globalKey.currentState!.save();

                  print(_email);
                  print(_password);
                  if (_globalKey.currentState!.validate()) {
                    print('Hello');

                    print(_email);
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _email, password: _password);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'Admin logged in successfully',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      )));
                    } on FirebaseException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        e.message!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      )));
                    }
                  }
                }),
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
