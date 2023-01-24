// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:newtharwatprojectjan18/provider/modal_hud.dart';
import 'package:newtharwatprojectjan18/screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../firebase_auth/Auth.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'sign up screen';
  String _email = '', _password = '';
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud>(context).isLoading,
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
                myHint: 'Enter your Name',
                myIcon: Icons.person,
                onClick: (String) {},
                myObscuredText: false,
              ),
              SizedBox(
                height: 10,
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
                height: 20,
              ),
              CustomButton(
                buttonTitle: 'Sign up',
                onClick: () async {
                  Provider.of<ModalHud>(context, listen: false)
                      .changeIsLoading(true);
                  if (_globalKey.currentState!.validate()) {
                    try {
                      final authResult = await Auth().signup(_email, _password);
                      print(authResult.user.uid);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Signup completed succesffuly',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                      ));
                      Provider.of<ModalHud>(context, listen: false)
                          .changeIsLoading(false);
                    } on FirebaseException catch (e) {
                      Provider.of<ModalHud>(context, listen: false)
                          .changeIsLoading(false);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.message!)));
                    }
                  }
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
                  Text('Already have an account?',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 14)),
                  TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, LogInScreen.id);
                      },
                      child: Text('Log in',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
