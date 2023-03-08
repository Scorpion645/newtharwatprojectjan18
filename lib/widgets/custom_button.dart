import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String butTitle;
  final Function()? onClick;
  const CustomButton({Key? key, required this.butTitle, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: TextButton(
          style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              backgroundColor: MaterialStatePropertyAll(Colors.black)),
          onPressed: onClick,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(butTitle,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white)),
          )),
    );
  }
}
