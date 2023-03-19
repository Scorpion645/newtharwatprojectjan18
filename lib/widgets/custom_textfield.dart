import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextField extends StatelessWidget {
  String? myHint;
  String? myInit;
  IconData? myIcon;
  bool myObscured;
  void Function(String?)? onClick;
  CustomTextField({this.myHint, this.myIcon, this.myObscured = false, this.onClick, this.myInit});
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String _errorMessage(String) {
    switch (myHint) {
      case 'Enter your Name':
        return 'Please enter your Name';
      case 'Enter your Email':
        return 'Please enter your Email';
      case 'Enter your Password':
        return 'Please enter your Password';
    }
    return '';
    
  }

  

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: TextFormField(
          initialValue: myInit,
          validator: (value) {
            if (value!.isEmpty) {
              return _errorMessage(myHint);
            }
          },
          obscureText: myObscured,
          decoration: InputDecoration(
            hintText: myHint,
            prefixIcon: Icon(
              myIcon,
              color: Colors.black,
            ),
            filled: true,
            fillColor: kSecondaryColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 3, color: Colors.white)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 3, color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 3, color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 3, color: Colors.white)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(width: 3, color: Colors.white)),
          ),
          onSaved: onClick,
        ));
  }
}
