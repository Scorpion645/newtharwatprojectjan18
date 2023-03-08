import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String butTitle;
  const CustomButton({Key? key, required this.butTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: TextButton(
          style: ButtonStyle(shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              backgroundColor: MaterialStatePropertyAll(Colors.black)),
          onPressed: () {},
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
