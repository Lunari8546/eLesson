// Packages Import
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIntoAccount({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      return "Signed In.";
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  Future<String> registerAccount({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      return "Account registered.";
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }
}