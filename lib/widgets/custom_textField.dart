import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Custom_TextField extends StatelessWidget {
  String? myHint;
  IconData? myIcon;
  Function(String?)? onClick;
  Custom_TextField({
    this.myHint,
    this.myIcon,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        onSaved: onClick,
        decoration: InputDecoration(
          prefixIcon: Icon(myIcon, color: Colors.black,),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3)),
          filled: true,
          fillColor: kSecondaryColor,
          hintText: myHint,
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(12)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
