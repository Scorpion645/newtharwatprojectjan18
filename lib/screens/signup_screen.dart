import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/modal_hud.dart';
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
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud>(context).isLoading,
        child: Form(
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
              },
            ),
            SizedBox(
              height: 10,
            ),
            CustomTextField(
              myobscured: true,
              myIcon: Icons.lock,
              myHint: 'Enter your Password',
              onClick: (value) {
                _password = value!;
              },
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              butTitle: 'Sign up',
              onClick: () async {
                Provider.of<ModalHud>(context, listen: false)
                    .ChangeIsLoading(true);
                _globalKey.currentState!.save();
                if (_globalKey.currentState!.validate()) {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('User created successfully',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    )));
                        Provider.of<ModalHud>(context, listen: false)
                        .ChangeIsLoading(false);
                  } on FirebaseException catch (e) {
                    Provider.of<ModalHud>(context, listen: false)
                        .ChangeIsLoading(false);
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
      ),
    );
  }
}
