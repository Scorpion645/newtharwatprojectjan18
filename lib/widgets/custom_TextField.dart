import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Custom_TextField extends StatelessWidget {
  final String myHint;
  final bool myObscuredText;
  final TextInputType myTextInputType;
  final Function(String)? myOnChange;
  final IconData myIcon;

  const Custom_TextField({
    super.key,
    required this.myHint,
    this.myObscuredText = false,
    this.myTextInputType = TextInputType.name,
    required this.myOnChange,
    required this.myIcon,
  });
  _errorMessage(String) {
    switch (myHint) {
      case 'Enter your Name':
        return 'Name is missing';
      case 'Enter your Email':
        return 'Email is missing';
      case 'Enter your password':
        return 'password is missing';

        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage(myHint);
          }
        },
        keyboardType: myTextInputType,
        onChanged: myOnChange,
        obscureText: myObscuredText,
        decoration: InputDecoration(
          filled: true,
          fillColor: kSecondaryColor,
          border: InputBorder.none,
          prefixIcon: Icon(
            myIcon,
            color: Colors.black,
          ),
          hintText: myHint,
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey[600]),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white, width: 3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white, width: 3)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white, width: 3)),
        ),
      ),
    );
  }
}
