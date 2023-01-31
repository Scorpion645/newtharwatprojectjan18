import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/Custom_button.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/custom_logo.dart';
import '../widgets/custom_row.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'login screen';
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
                height: 40,
              ),
              CustomLogo(),
              SizedBox(
                height: 20,
              ),
              // Enter your e_mail custom_Textfield.
              Custom_TextField(
                myHint: 'Enter your Email',
                myIcon: Icons.mail,
                myOnChange: (value) {
                  _email = value;
                },
                myObscuredText: false,
                myTextInputType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 10,
              ),
              // Enter your password custom_Textfield.
              Custom_TextField(
                myHint: 'Enter your password',
                myIcon: Icons.lock,
                myOnChange: (value) {
                  _password = value;
                },
                myObscuredText: true,
                myTextInputType: TextInputType.text,
              ),
              SizedBox(
                height: 79,
              ),
              //  Custom button.
              CustomButton(
                myButtonTitle: 'Log in',
                myButtonFunction: () async {
                  if (_globalKey.currentState!.validate()) {
                    try {
                      final authResult = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Successful Login!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.center)));
                    } on FirebaseException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.message!,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                              textAlign: TextAlign.center)));
                    }
                  }
                },
              ),
              //  Custom Row.
              CustomRow(
                firstText: 'Do not have an account yet?',
                secondText: 'Sign up',
                secondTextAction: () {
                  Navigator.popAndPushNamed(context, SignUpScreen.id);
                },
              )
            ],
          ),
        ));
  }
}
