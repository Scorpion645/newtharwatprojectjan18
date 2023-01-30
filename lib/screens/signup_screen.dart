import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_logo.dart';

class SignUpScreen extends StatelessWidget {
  static String id = 'sign up screen';
  //  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainColor,
        body: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomLogo(),
            SizedBox(height: 20,),
            Custom_TextField(),
          ],
        ));
  }
}

class Custom_TextField extends StatelessWidget {
  const Custom_TextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: TextInputType.name,
        onChanged: (value) {},
        obscureText: false,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white, width: 3)),
          filled: true,
          fillColor: kSecondaryColor,
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          hintText: 'Enter your Name',
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey[600]),
        ),
      ),
    );
  }
}
