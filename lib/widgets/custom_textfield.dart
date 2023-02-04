import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String myHint;
  final IconData? myIcon;
  bool myObscuredText;
  final TextInputType? myKeyboard;
  final Function(String)? onClick;

  CustomTextField(
      {required this.myHint,
      this.myIcon,
      this.myKeyboard,
      this.myObscuredText = false,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        onChanged: onClick,
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
