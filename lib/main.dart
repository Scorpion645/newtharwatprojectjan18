import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/admin_mode.dart';
import 'provider/modelhud.dart';
import 'screens/admin/add_product.dart';
import 'screens/admin/admin_home.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) {
        return ModelHud();
      },
    ),
    //replace the void Main function with the current text
    ChangeNotifierProvider(
      create: (BuildContext context) {
        return AdminMode();
      },
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SignUpScreen.id,
      routes: {
        SignUpScreen.id: (context) => SignUpScreen(),
        LogInScreen.id: (context) => LogInScreen(),
        AdminScreen.id: (context) => AdminScreen(),
        AddProduct.id: (context) => AddProduct(),
      },
    );
  }
}
//replace the void Main function with the current text

