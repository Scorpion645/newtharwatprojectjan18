import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/Custom_row.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/logo.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'sign up screen';
  SignUpScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  late String _email, _password, _name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(children: [
          SizedBox(
            height: 60,
          ),
          Logo(),
          SizedBox(
            height: 40,
          ),
          CustomTextField(
            myIcon: Icons.person,
            myHint: 'Enter your Name',
            onClick: (value) {
              _name = value!;
              print(_name);
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            myIcon: Icons.email,
            myHint: 'Enter your Email',
            onClick: (value) {
              _email = value!;
              print(_email);
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            myIcon: Icons.lock,
            myHint: 'Enter your Password',
            onClick: (value) {
              _password = value!;
              print(_password);
            },
          ),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            butTitle: 'Sign up',
            onClick: () async {
              _globalKey.currentState!.save();
              if (_globalKey.currentState!.validate()) {
                print('Hello');
                print(_email);
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _email, password: _password);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('User created successfully')));
                } on FirebaseException catch (e) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.message!)));
                }
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomRow(
              firstText: 'Already have an accunt?',
              secText: 'Log in',
              onClick: (() {
                Navigator.pushNamed(context, LoginScreen.id);
              })),
        ]),
      ),
    );
  }
}
