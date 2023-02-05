import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/Custom_Row.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/logo.dart';
import '../widgets/signup_button.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'Login screen';
  LoginScreen({Key? key}) : super(key: key);
  late String _email, _password;
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
                height: 80,
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
                buttonTitle: 'Log in',
                onClick: () async{
                  if (_globalKey.currentState!.validate()) {
                    try {
                     await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _email, password: _password);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'Successful Login!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        textAlign: TextAlign.center,
                      )));
                      
                    } on FirebaseException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        e.message!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                        textAlign: TextAlign.center,
                      )));
                    }
                  }
                },
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
          ),
        ));
  }
}
