import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  signup(_email, _password) {
    return _auth.createUserWithEmailAndPassword(
        email: _email, password: _password);

  }

  login(_email, _password) {
    return _auth.signInWithEmailAndPassword(
        email: _email, password: _password);

  }
}
