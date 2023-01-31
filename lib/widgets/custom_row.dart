import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String firstText;
  final String secondText;
  final VoidCallback? secondTextAction;

  const CustomRow({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.secondTextAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText),
        TextButton(
            onPressed: secondTextAction,
            child: Text(secondText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black)))
      ],
    );
  }
}
