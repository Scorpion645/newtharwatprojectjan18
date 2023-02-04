import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String firstRowText;
  final String secondRowText;
  void Function()? onClick;
   CustomRow({
    super.key,
    required this.firstRowText,
    required this.secondRowText,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstRowText, style: TextStyle(fontSize: 16, color: Colors.black)),
        TextButton(
            onPressed: onClick,
            child: Text(secondRowText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black)))
      ],
    );
  }
}
