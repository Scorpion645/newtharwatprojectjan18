import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/Custom_Row.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/logo.dart';
import '../widgets/signup_button.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'sign up screen';
  late String _name, _email, _password;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainColor,
        body: Form(
          key: _globalKey,
          child: ListView(
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
                onClick: (value) {
                  _name = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                myHint: 'Enter your Email',
                myIcon: Icons.email,
                myKeyboard: TextInputType.emailAddress,
                onClick: (value) {
                  _email = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                myHint: 'Enter your Password',
                myIcon: Icons.lock,
                myKeyboard: TextInputType.visiblePassword,
                myObscuredText: true,
                onClick: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: 30,
              ),
              SignupButton(
                buttonTitle: 'Sign up',
                onClick: () {
                  _globalKey.currentState!.validate();
                },
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
          ),
        ));
  }
}
