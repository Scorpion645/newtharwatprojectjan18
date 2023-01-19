import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import 'signup_screen.dart';

class LogInScreen extends StatelessWidget {
  static String id = 'login screen';
   String _email = '', _password = '';
   LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        children: [
          Stack(alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Image.asset('assets/images/icons8-buy-100.png'),
              ),
              Positioned(
                  bottom: 0,
                  child: const Text('Buy it',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'pacifico'))),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CustomTextField(
            myHint: 'Enter your Email',
            myIcon: Icons.email,
            onClick: (String value) {
              _email = value;
            },
            myObscuredText: false,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            myHint: 'Enter your password',
            myIcon: Icons.lock,
            onClick: (value) {
              _password = value;
            },
            myObscuredText: true,
          ),
          SizedBox(
            height: 10,
          ),
          
          SizedBox(
            height: 79,
          ),
          CustomButton(
            buttonTitle: 'Log in',
            onClick: () {
              print(_email);
              print(_password);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Do not have an account?',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),
              TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, SignUpScreen.id);
                  },
                  child: Text('Sign up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black)))
            ],
          )
        ],
      ),
    );
  }
}
