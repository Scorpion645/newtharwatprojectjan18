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
import 'admin/Admin_home.dart';
import 'signup_screen.dart';

class LogInScreen extends StatelessWidget {
  static String id = 'login screen';
  String _email = '', _password = '';
  LogInScreen({super.key});
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _adminPassword = 'Admin1234';

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
                    Provider.of<ModelHud>(context, listen: false)
                        .changeisLoading(true);
                    if (_globalKey.currentState!.validate()) {
                      print('Validation ok');
                      if (Provider.of<AdminMode>(context, listen: false)
                              .isAdmin &&
                          _password == _adminPassword) {
                        print(
                            'Admin button on and password equal admin passworld');
                        try {
                          final authResult =
                              await Auth().Login(_email, _password);
                          Provider.of<ModelHud>(context, listen: false)
                              .changeisLoading(false);
                          print(authResult.user.uid);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            'Successful log in as Admin',
                            textAlign: TextAlign.center,
                          )));
                          Navigator.popAndPushNamed(context, AdminHome.id);
                        } on FirebaseException catch (e) {
                          print('text2');
                          Provider.of<ModelHud>(context, listen: false)
                              .changeisLoading(false);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.message!)));
                        }
                        print('text3');
                      } else {
                        // print('text4');
                        try {
                          print('text5');
                          final authResult =
                              await Auth().Login(_email, _password);
                          Provider.of<ModelHud>(context, listen: false)
                              .changeisLoading(false);
                          print(authResult.user.uid);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            'Successful log in as user',
                            textAlign: TextAlign.center,
                          )));
                        } on FirebaseException catch (e) {
                          print('text2');
                          Provider.of<ModelHud>(context, listen: false)
                              .changeisLoading(false);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            e.message!,
                            textAlign: TextAlign.center,
                          )));
                        }
                      }
                    } else {
                      print('text6');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'Please enter missing information',
                        textAlign: TextAlign.center,
                      )));
                      Provider.of<ModelHud>(context, listen: false)
                          .changeisLoading(false);
                    }
                    // print('text7');
                  }),
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
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Provider.of<AdminMode>(context, listen: false)
                              .changeIsAdmin(true);
                          // print(isAdmin);
                        },
                        child: Text(
                          'I am Admin',
                          style: TextStyle(
                              color: Provider.of<AdminMode>(context).isAdmin
                                  ? kMainColor
                                  : Colors.white),
                        )),
                    TextButton(
                      onPressed: () {
                        Provider.of<AdminMode>(context, listen: false)
                            .changeIsAdmin(false);
                      },
                      child: Text(
                        'I am a user',
                        style: TextStyle(
                            color: Provider.of<AdminMode>(context).isAdmin
                                ? Colors.white
                                : kMainColor),
                      ),
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
}
