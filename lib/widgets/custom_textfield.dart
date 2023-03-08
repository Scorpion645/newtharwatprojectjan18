import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String? myHint;
  final IconData? myIcon;
  CustomTextField({Key? key, this.myHint, this.myIcon}) : super(key: key);
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String _errorMessage() {
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
        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage();
          } else
            return 'good Job';
        },
        decoration: InputDecoration(
          constraints: BoxConstraints(maxHeight: 80),
          filled: true,
          fillColor: kSecondaryColor,
          prefixIcon: Icon(
            myIcon,
            color: Colors.black,
          ),
          hintText: myHint,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(12)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(12)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
