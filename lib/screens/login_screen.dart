import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/admin_mode.dart';
import '../widgets/Custom_button.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/custom_logo.dart';
import '../widgets/custom_row.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'login screen';
  late String _email, _password;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
// bool isAdmin = false;
  String _adminPassword = 'Admin1234';

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
                  // print(AdminMode().isAdmin);
                  if (_globalKey.currentState!.validate() &&
                      _password == _adminPassword &&
                      Provider.of<AdminMode>(context, listen: false).isAdmin == true) {
                    try {
                      final authResult = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Successful Admin Login!',
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
                  } else {
                    try {
                      final authResult = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _email, password: _password);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Successful User Login!',
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
              ),
              // Admin row.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Provider.of<AdminMode>(context, listen: false)
                              .changeIsAdmin(true);
                          // print(Provider.of<AdminMode>(context, listen: false).isAdmin);
                        },
                        child: Text('I am an Admin!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Provider.of<AdminMode>(context).isAdmin
                                    ? kMainColor
                                    : Colors.white))),
                    TextButton(
                        onPressed: () {
                          Provider.of<AdminMode>(context, listen: false)
                              .changeIsAdmin(false);
                              // print(Provider.of<AdminMode>(context, listen: false)
                              // .isAdmin);
                        },
                        child: Text('I am an User!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Provider.of<AdminMode>(context).isAdmin
                                    ? Colors.white
                                    : kMainColor))),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
