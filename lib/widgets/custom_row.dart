import 'package:flutter/material.dart';

class Custom_Row extends StatelessWidget {
  String firstText;
  String secondText;
  VoidCallback onClick;

  Custom_Row({
    required this.firstText,
    required this.secondText,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText),
        TextButton(
            onPressed: onClick,
            child: Text(secondText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black)))
      ],
    );
  }
}
