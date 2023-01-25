import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../firebase_auth/Auth.dart';
import '../provider/modal_hud.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';
import 'signup_screen.dart';

class LogInScreen extends StatelessWidget {
  static String id = 'login screen';
  String _email = '', _password = '';
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  LogInScreen({super.key});

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
                  Provider.of<ModalHud>(context, listen: false)
                      .changeIsLoading(true);
                  if (_globalKey.currentState!.validate()) {
                    try {
                      await Auth().login(_email, _password);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'Login successful!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )));
                      Provider.of<ModalHud>(context, listen: false)
                      .changeIsLoading(false);
                    } on FirebaseException catch (e) {
                      Provider.of<ModalHud>(context, listen: false)
                      .changeIsLoading(false);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.message!)));
                    }
                  }
                  Provider.of<ModalHud>(context, listen: false)
                      .changeIsLoading(false);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
