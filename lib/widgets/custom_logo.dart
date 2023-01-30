import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 28.0),
          child: Image(image: AssetImage('assets/images/icons8-buy-100.png')),
        ),
        Positioned(
          bottom: 0,
          child: Text('Buy it',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: 'pacifico')),
        ),
      ],
    );
  }
}
