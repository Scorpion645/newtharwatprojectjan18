import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String butTitle;
  void Function()? onClick;
  CustomButton({required this.butTitle, this.onClick,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
          onPressed: onClick,
          child: Text(butTitle,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white))),
    );
  }
}
