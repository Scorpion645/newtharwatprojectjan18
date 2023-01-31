import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/modal_hud.dart';
import '../widgets/Custom_button.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/custom_logo.dart';
import '../widgets/custom_row.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'sign up screen';
  late String _name, _email, _password;
  final String adminPassword = 'Admin1234';
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  //  SignUpScreen({Key? key}) : super(key: key);

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
                SizedBox(
                  height: 40,
                ),
                CustomLogo(),
                SizedBox(
                  height: 20,
                ),
                // Enter your name custom_Textfield.
                Custom_TextField(
                  myHint: 'Enter your Name',
                  myIcon: Icons.person,
                  myOnChange: (value) {
                    _name = value;
                  },
                  myObscuredText: false,
                  myTextInputType: TextInputType.name,
                ),
                SizedBox(
                  height: 10,
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
                  height: 10,
                ),
                //  Custom button, Sign up button.
                CustomButton(
                  myButtonTitle: 'Sign up',
                  myButtonFunction: () async {
                    Provider.of<ModalHud>(context, listen: false).changeIsLoading(true);
                    if (_globalKey.currentState!.validate()) {
                      try {
                        final authResult = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _email, password: _password);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Account created successfully!',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                                textAlign: TextAlign.center)));
                                Provider.of<ModalHud>(context, listen: false).changeIsLoading(false);
                      } on FirebaseException catch (e) {
                        Provider.of<ModalHud>(context, listen: false).changeIsLoading(false);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          e.message!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                          textAlign: TextAlign.center,
                        )));
                      }
                    }
                  },
                ),
                //  Custom Row.
                CustomRow(
                  firstText: 'Already have an account?',
                  secondText: 'Log in',
                  secondTextAction: () {
                    Navigator.popAndPushNamed(context, LoginScreen.id);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
