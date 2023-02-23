import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  String? myButText;
  Function? onClick;
  Custom_Button({
    this.myButText,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick!(),
      child: Text(myButText!,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        backgroundColor: MaterialStateProperty.all(Colors.black),
      ),
    );
  }
}
