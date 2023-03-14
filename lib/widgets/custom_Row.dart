import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  String firstText;
  String secondText;
  Function()? onclick;
  CustomRow({required this.firstText,
    required this.secondText, this.onclick,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText),
        TextButton(
            onPressed: onclick,
            child: Text(secondText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black)))
      ],
    );
  }
}
