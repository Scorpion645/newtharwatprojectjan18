import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/admin_mode.dart';
import 'screens/Home_screen.dart';
import 'screens/admin screens/main_admin_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return AdminMode();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      routes: {
        SignUpScreen.id:(context) =>  SignUpScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        MainAdminScreen.id: (context) => MainAdminScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      },
    );
  }
}

