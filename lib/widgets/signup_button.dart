import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  final String buttonTitle;
  void Function()? onClick;
  SignupButton({
    super.key,
    required this.buttonTitle,
    this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: TextButton(
        onPressed: onClick,
        child: Text(buttonTitle,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white)),
        style: ButtonStyle(
            padding:
                MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
            backgroundColor: MaterialStateProperty.all(
              Colors.black,
            )),
      ),
    );
  }
}
