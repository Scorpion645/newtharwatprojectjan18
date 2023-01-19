import 'package:flutter/material.dart';

import '../constants/constants.dart';

class LogInScreen extends StatelessWidget {
  static String id = 'login screen';
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        children: [
          Stack(alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Image.asset('assets/images/icons8-buy-100.png'),
              ),
              Positioned(
                  bottom: 0,
                  child: const Text('Buy it',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: 'pacifico'))),
            ],
          )
        ],
      ),
    );
  }
}
