import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String myButtonTitle;
  VoidCallback? myButtonFunction;
  CustomButton({super.key, required this.myButtonTitle, this.myButtonFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
      child: TextButton(
          style: ButtonStyle(
              padding:
                  MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
              backgroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
          onPressed: myButtonFunction,
          child: Text(myButtonTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white))),
    );
  }
}
