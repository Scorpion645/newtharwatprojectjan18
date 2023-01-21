import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Signup(_email, _password) {
    final authResult = _auth.createUserWithEmailAndPassword(
        email: _email, password: _password);
    return authResult;
  }

   Login(_email, _password) {
    final authResult = _auth.signInWithEmailAndPassword(
        email: _email, password: _password);
    return authResult;
  }

}
