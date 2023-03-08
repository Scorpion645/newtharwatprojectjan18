import 'package:flutter/material.dart';

import '../constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final String? myHint;
  final IconData? myIcon;
  const CustomTextField({Key? key, this.myHint, this.myIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        decoration: InputDecoration(
          constraints: BoxConstraints(maxHeight: 60),
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
