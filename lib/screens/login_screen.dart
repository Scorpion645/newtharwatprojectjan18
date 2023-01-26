import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../firebase_auth/Auth.dart';
import '../provider/admin_mode.dart';
import '../provider/modelhud.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import 'signup_screen.dart';

class LogInScreen extends StatelessWidget {
  static String id = 'login screen';
  String _email = '', _password = '';
  // bool progressIndicator = false;
  LogInScreen({super.key});
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  bool isAdmin = false;
  final adminPassword = 'Admin1234';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ModalProgressHUD(
        color: Colors.black,
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              Stack(
                alignment: Alignment.center,
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
                onClick: () async {
                  _validate(context);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Do not have an account? ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14)),
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
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 93, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Provider.of<AdminMode>(context, listen: false)
                            .changeIsAdmin(true);
                      },
                      child: Text('I am an Admin',
                          style: TextStyle(
                              color: Provider.of<AdminMode>(context).isAdmin
                                  ? kMainColor
                                  : Colors.white)),
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<AdminMode>(context, listen: false)
                            .changeIsAdmin(false);
                      },
                      child: Text('I am a User',
                          style: TextStyle(
                              color: Provider.of<AdminMode>(context).isAdmin
                                  ? Colors.white
                                  : kMainColor)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _validate(BuildContext context) async {
    final modelHud = Provider.of<ModelHud>(context, listen: false);
    modelHud.changeisLoading(true);
    if (_globalKey.currentState!.validate()) {
      if (Provider.of<AdminMode>(context, listen: false).isAdmin) {
        if (_password == adminPassword) {
          try {
            final authResult = await Auth().Login(_email, _password);
            modelHud.changeisLoading(false);
            print(authResult.user.uid);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              'Admin Login successful!',
              textAlign: TextAlign.center,
            )));
          } on FirebaseException catch (e) {
            modelHud.changeisLoading(false);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.message!)));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            'Not a recognized admin account',
            textAlign: TextAlign.center,
          )));
        }
      } else {
        try {
          final authResult = await Auth().Login(_email, _password);
          modelHud.changeisLoading(false);
          print(authResult.user.uid);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            'Login successful!',
            textAlign: TextAlign.center,
          )));
        } on FirebaseException catch (e) {
          modelHud.changeisLoading(false);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.message!)));
        }
      }
    }
    modelHud.changeisLoading(false);
  }
}
