import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home screen';
const HomeScreen ({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Scaffold(
body: Center(child: Text('Home Screen')),
);
}
}