import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  signup(_email, _password) {
    final authresult = _auth.createUserWithEmailAndPassword(
        email: _email, password: _password);
  }

  Login(_email, _password) {
    final authResult =
        _auth.signInWithEmailAndPassword(email: _email, password: _password);
    return authResult;
  }
}
