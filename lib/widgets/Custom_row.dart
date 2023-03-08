import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String firstText;
  final String secText;
  const CustomRow({Key? key, required this.firstText, required this.secText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(firstText),
        TextButton(
            onPressed: () {},
            child: Text(secText,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black)))
      ],
    );
  }
}
