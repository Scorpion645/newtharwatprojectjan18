import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String myHint;
  IconData? myIcon;
  Color? myColor;
  bool myObscuredText;
  final Function(String)? onClick;
  CustomTextField(
      {required this.myHint,
      this.myIcon,
      this.onClick,
      this.myColor,
      required this.myObscuredText});

  String _errorMessage(String hint) {
    switch (myHint) {
      case 'Enter your Name':
        return 'Name is missing';
      case 'Enter your Email':
        return 'Email is missing';
      case 'Enter your password':
        return 'password is missing';

      //   break;
      // default:
    }
    return "null";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage(myHint);
          }
        },
        onChanged: onClick,
        obscureText: myObscuredText,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Icon(
              myIcon,
              color: Colors.black,
            ),
          ),
          hintText: myHint,
          hintStyle: TextStyle(color: Colors.white),
          filled: true,
          fillColor: myColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 3, color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 3, color: Colors.white)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 3, color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(width: 3, color: Colors.white)),
        ),
      ),
    );
  }
}
