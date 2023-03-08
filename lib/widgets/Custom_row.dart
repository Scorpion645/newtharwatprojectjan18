import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String firstText;
  final String secText;
  final Function()? onClick;
  const CustomRow({Key? key, required this.firstText, required this.secText, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText),
        TextButton(
            onPressed: onClick,
            child: Text(secText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black)))
      ],
    );
  }
}
