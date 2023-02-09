import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'admin/Add_Product_Screen.dart';
import 'admin/Edit_product_screen.dart';
import 'admin/main_admin_screen.dart';
import 'provider/iAmAdmin.dart';
import 'provider/modalHud.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      (ChangeNotifierProvider(
          create: (BuildContext context) {
            return IAmAdmin();
          },
          child: MyApp())),
      (ChangeNotifierProvider(
          create: (BuildContext context) {
            return ModalHud();
          },
          )),
    ],
    child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: EditProductScreen.id,
      routes: {
        SignUpScreen.id: (context) => SignUpScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        MainAdminScreen.id: (context) => MainAdminScreen(),
        AddProductScreen.id: (context) => AddProductScreen(),
        EditProductScreen.id: (context) => EditProductScreen(),
      },
    );
  }
}
