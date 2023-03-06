import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../admin/main_admin_screen.dart';
import '../constants/constants.dart';
import '../provider/iAmAdmin.dart';
import '../provider/modalHud.dart';
import '../widgets/Custom_Row.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/logo.dart';
import '../widgets/signup_button.dart';
import 'Home_page_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'Login screen';
  LoginScreen({Key? key}) : super(key: key);
  late String _email, _password;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _adminPassword = 'Admin1234';

  @override
  Widget build(BuildContext context) {
    var adminOrNot = Provider.of<IAmAdmin>(context).iAmAdmin;
    return Scaffold(
        backgroundColor: kMainColor,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModalHud>(context).isLoading,
          child: Form(
            key: _globalKey,
            child: ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Logo(),
                SizedBox(
                  height: 80,
                ),
                CustomTextField(
                  myHint: 'Enter your Email',
                  myIcon: Icons.email,
                  myKeyboard: TextInputType.emailAddress,
                  onClick: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  myHint: 'Enter your Password',
                  myIcon: Icons.lock,
                  myKeyboard: TextInputType.visiblePassword,
                  myObscuredText: true,
                  onClick: (value) {
                    _password = value!;
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                SignupButton(
                  buttonTitle: 'Log in',
                  onClick: () async {
                    _globalKey.currentState!.save();
                    Provider.of<ModalHud>(context, listen: false)
                        .changeisLoading(true);
                    if (_globalKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          _password == _adminPassword
                              ? 'Successful Admin Login!'
                              : 'Successful User Login!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                          textAlign: TextAlign.center,
                        )));
                        Provider.of<ModalHud>(context, listen: false)
                            .changeisLoading(false);
                        if (_password == _adminPassword) {
                          Navigator.pushNamed(context, MainAdminScreen.id);
                        } else {
                          Navigator.pushNamed(context, HomePage.id);
                        }
                      } on FirebaseException catch (e) {
                        Provider.of<ModalHud>(context, listen: false)
                            .changeisLoading(false);
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
                SizedBox(
                  height: 30,
                ),
                CustomRow(
                  firstRowText: 'Do Not have an account?',
                  secondRowText: 'Sign up',
                  onClick: () {
                    Navigator.popAndPushNamed(context, SignUpScreen.id);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Provider.of<IAmAdmin>(context, listen: false)
                              .ChangeiAmAdmin(true);
                          print(Provider.of<IAmAdmin>(context, listen: false)
                              .iAmAdmin);
                        },
                        child: Text('Admin Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color:
                                    adminOrNot ? kMainColor : Colors.white))),
                    TextButton(
                        onPressed: () {
                          Provider.of<IAmAdmin>(context, listen: false)
                              .ChangeiAmAdmin(false);
                          print(Provider.of<IAmAdmin>(context, listen: false)
                              .iAmAdmin);
                        },
                        child: Text('User Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color:
                                    adminOrNot ? Colors.white : kMainColor))),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
