import 'package:flutter/material.dart';

Widget Logo() {
  return Stack(
    alignment: Alignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Image.asset('assets/images/icons8-buy-100.png'),
      ),
      Positioned(
          bottom: 0,
          child: Text('Buy it',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'pacifico')))
    ],
  );
}
