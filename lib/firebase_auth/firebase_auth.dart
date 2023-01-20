import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  signup(_email, _password) async {
    final authResult = await _auth.createUserWithEmailAndPassword(
        email: _email, password: _password);
    return authResult;
  }

  Login(_email, _password) async {
    final authResult = await _auth.signInWithEmailAndPassword(
        email: _email, password: _password);
    return authResult;
  }
}
