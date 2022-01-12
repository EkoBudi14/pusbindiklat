import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User> signUp(
    String email,
    String password,
    String name,
    String completeName,
    String noTelp,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = userCredential.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  static Future<User> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = userCredential.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  static Future<void> signOut() {
    return _auth.signOut();
  }

  static Stream<User> get firebaseUserStream => _auth.authStateChanges();
}
