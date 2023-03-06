import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String? myHint;
  final String? myInitVal;
  final IconData? myIcon;
  bool myObscuredText;
  final TextInputType? myKeyboard;
  final void Function(String?)? onClick;

  CustomTextField(
      { this.myHint,
      this.myInitVal,
      this.myIcon,
      this.myKeyboard,
      this.myObscuredText = false,
      this.onClick});

  String _errorMessage(String theHint) {
    switch (myHint) {
      case 'Enter your Name':
        return 'Name is missing';
      case 'Enter your Email':
        return 'Email is missing';
      case 'Enter your Password':
        return 'Password is missing';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        initialValue: myInitVal,
        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage(myHint!);
          }
        },
        onSaved: onClick,
        obscureText: myObscuredText,
        keyboardType: myKeyboard,
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor,
          hintText: myHint,
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          prefixIcon: Icon(
            myIcon,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
