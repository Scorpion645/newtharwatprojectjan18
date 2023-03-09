import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String? myHint;
  final IconData? myIcon;
 bool myobscured = false;
  void Function(String?)? onClick;
  CustomTextField({Key? key, this.myHint, this.myIcon,this.myobscured = false,required this.onClick}) : super(key: key);
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String _errorMessage(String) {
    switch (myHint) {
      case 'Enter your Name':
        return 'Please enter your Name';
      case 'Enter your Email':
        return 'Please enter your Email';
      case 'Enter your Password':
        return 'Please enter your Password';
        case 'Add product name':
        return 'Please enter product name';
         case 'Add product price':
        return 'Please enter product price';
         case 'Add product category':
        return 'Please enter product category';
         case 'Add product description':
        return 'Please enter product description';
         case 'Add product image':
        return 'Please enter product image';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        obscureText: myobscured,
        onSaved: onClick,
        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage(myHint);
          } 
            // return '';
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
