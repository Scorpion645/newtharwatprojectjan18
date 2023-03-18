import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/Admin.dart';
import '../provider/modal_progres_hud.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_Row.dart';
import '../widgets/custom_TextField.dart';
import '../widgets/logo.dart';
import '../widgets/sizedbox.dart';
import 'Home_screen.dart';
import 'admin_screens/main_admin_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'log in screen';
  late String _email, _password;
  final String adminPassword = 'Admin1234';
  bool isLoading = false;
  LoginScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalProgressHud>(context).isLoading,
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              heightSizedbox(60),
              Logo(),
              heightSizedbox(20),
              CustomTextField(
                myIcon: Icons.email,
                myHint: 'Enter your Email',
                onClick: (value) {
                  _email = value!;
                },
              ),
              heightSizedbox(20),
              CustomTextField(
                myIcon: Icons.lock,
                myHint: 'Enter your Password',
                myObscured: true,
                onClick: (value) {
                  _password = value!;
                },
              ),
              heightSizedbox(99),
              CustomButton(
                  butTitle: 'Log in',
                  onClick: () async {
                    Provider.of<ModalProgressHud>(context, listen: false)
                        .ChangeIsLoading(true);
                    _globalKey.currentState!.save();
                    if (_globalKey.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        if (_password == adminPassword &&
                            Provider.of<AdminUser>(context, listen: false)
                                .isAdmin) {
                          Navigator.pushNamed(context, MainAdminScreen.id);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            'Successful login as ADMIN',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.center,
                          )));
                        } else if (_password != adminPassword ||
                            Provider.of<AdminUser>(context, listen: false)
                                    .isAdmin ==
                                false) {
                          Navigator.pushNamed(context, HomeScreen.id);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            'Successful Login as USER',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          )));
                        }
                        Provider.of<ModalProgressHud>(context, listen: false)
                            .ChangeIsLoading(false);
                      } on FirebaseException catch (e) {
                        Provider.of<ModalProgressHud>(context, listen: false)
                            .ChangeIsLoading(false);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          e.message!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                          textAlign: TextAlign.center,
                        )));
                      }
                    }
                    Provider.of<ModalProgressHud>(context, listen: false)
                        .ChangeIsLoading(false);
                  }),
              CustomRow(
                firstText: 'Already have an account?',
                secondText: 'Signup',
                onclick: () {
                  Navigator.pushNamed(context, SignUpScreen.id);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Provider.of<AdminUser>(context, listen: false)
                            .ChangeAdmin(true);
                      },
                      child: Text('ADMIN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Provider.of<AdminUser>(context).isAdmin
                                  ? 20
                                  : 14,
                              color: Provider.of<AdminUser>(context).isAdmin
                                  ? Colors.white
                                  : Colors.grey[500]))),
                  SizedBox(
                    width: 90,
                  ),
                  TextButton(
                      onPressed: () {
                        Provider.of<AdminUser>(context, listen: false)
                            .ChangeAdmin(false);
                      },
                      child: Text('USER',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Provider.of<AdminUser>(context).isAdmin
                                  ? 14
                                  : 20,
                              color: Provider.of<AdminUser>(context).isAdmin
                                  ? Colors.grey[500]
                                  : Colors.white))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
