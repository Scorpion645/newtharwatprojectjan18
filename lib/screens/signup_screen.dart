import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/custom_row.dart';
import '../widgets/logo.dart';
import '../widgets/sizedbox.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'sign up screen';
  late String _name, _email, _password;
  SignUpScreen({Key? key}) : super(key: key);
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
              myIcon: Icons.person,
              myHint: 'Enter your Name',
              onClick: (value) {
                _name = value!;
              },
            ),
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
            heightSizedbox(20),
            CustomButton(
              butTitle: 'Sign up',
              onClick: () async {
                 _globalKey.currentState!.save();
                if (_globalKey.currentState!.validate()) {
                  try {
                   
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      'Successful sign up',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    )));
                  }on FirebaseException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                    e.message!,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    textAlign: TextAlign.center,
                    )));
                  }
                } 
              },
            ),
            CustomRow(
              firstText: 'Already have an account?',
              secondText: 'Login',
              onclick: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
