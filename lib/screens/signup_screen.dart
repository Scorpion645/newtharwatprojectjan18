// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:newtharwatprojectjan18/provider/modelhud.dart';
import 'package:newtharwatprojectjan18/screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../firebase_auth/Auth.dart';
import '../widgets/customButton.dart';
import '../widgets/customTextField.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'sign up screen';
  late String _email = '', _password = '';
  final GlobalKey<FormState> _globalKeys = GlobalKey<FormState>();
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
          key: _globalKeys,
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
                height: 20,
              ),
              CustomTextField(
                myHint: 'Enter your Email',
                myIcon: Icons.email,
                onClick: (value) {
                  _email = value;
                },
                myObscuredText: false,
              ),
              SizedBox(
                height: 20,
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
                  Provider.of<ModelHud>(context, listen: false)
                        .changeisLoading(true);
                  if (_globalKeys.currentState!.validate()) {
                    try {
                      final authResult = await Auth().Signup(_email, _password);
                      print(authResult.user.uid);
                      Provider.of<ModelHud>(context, listen: false)
                          .changeisLoading(false);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'Sign up successful!',
                        textAlign: TextAlign.center,
                      )));
                    } on FirebaseException catch (e) {
                      Provider.of<ModelHud>(context, listen: false)
                          .changeisLoading(false);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.message!)));
                    }
                  }
                  Provider.of<ModelHud>(context, listen: false)
                      .changeisLoading(false);
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',
                      style:
                          TextStyle(fontWeight: FontWeight.normal, fontSize: 14)),
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
