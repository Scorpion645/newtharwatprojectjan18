import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/Admin.dart';
import 'provider/modal_progres_hud.dart';
import 'screens/Home_screen.dart';
import 'screens/admin_screens/add_product_screen.dart';
import 'screens/admin_screens/edit_product_screen.dart';
import 'screens/admin_screens/main_admin_screen.dart';
import 'screens/admin_screens/manage_product_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) {
      return AdminUser();
    }),
    ChangeNotifierProvider(create: (context) {
      return ModalProgressHud();
    })
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ManageProductScreen.id,
      routes: {
        SignUpScreen.id: (context) => SignUpScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        MainAdminScreen.id: (context) => MainAdminScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        AddProductScreen.id: (context) => AddProductScreen(),
        EditProductScreen.id: (context) => EditProductScreen(),
        ManageProductScreen.id: (context) => ManageProductScreen(),
      },
    );
  }
}
