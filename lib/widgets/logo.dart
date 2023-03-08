import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
}
