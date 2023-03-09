import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/admin_mode.dart';
import '../widgets/Custom_row.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/logo.dart';
import 'Home_screen.dart';
import 'admin%20screens/main_admin_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'login screen';
  late String _email, _password;
  final String _adminPassword = 'Admin1234';
  LoginScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();


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
            myIcon: Icons.email,
            myHint: 'Enter your Email',
            onClick: (value) {
              _email = value!;
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
            height: 89,
          ),
          CustomButton(
            butTitle: 'Log in',
            onClick: () async {
              _globalKey.currentState!.save();

              if (_globalKey.currentState!.validate()) {
                print(_email);
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _email, password: _password);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                      _password == _adminPassword
                        ? 'Admin logged in successfully'
                        : 'User logged in successfully',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  )));
                  _password == _adminPassword
                      ? Navigator.pushNamed(context, MainAdminScreen.id)
                      : Navigator.pushNamed(context, HomeScreen.id);
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
            },
          ),
          SizedBox(
            height: 10,
          ),
          CustomRow(
              firstText: 'Do Not have an accunt?',
              secText: 'Sign up',
              onClick: (() {
                Navigator.pushNamed(context, SignUpScreen.id);
              })),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Provider.of<AdminMode>(context, listen: false)
                        .ChangeIsAdmin(true);
                  },
                  child: Text('Admin',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Provider.of<AdminMode>(context).isAdmin
                              ? kMainColor
                              : Colors.white)),
                ),
                TextButton(
                  onPressed: () {
                    Provider.of<AdminMode>(context, listen: false)
                        .ChangeIsAdmin(false);
                  },
                  child: Text('User',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Provider.of<AdminMode>(context).isAdmin
                              ? Colors.white
                              : kMainColor)),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
