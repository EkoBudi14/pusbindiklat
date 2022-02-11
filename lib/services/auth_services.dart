import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User> signUp(
    String email,
    String password,
    String name,
    String completeName,
    String noTelp,
    // String url,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      File _pickedImage;
      final User userse = userCredential.user;
      // final User user = _auth.currentUser;
      final _uid = userse.uid;
      final ref = FirebaseStorage.instance.ref().child('users').child(name);
      await ref.putFile(_pickedImage);
      // url = await ref.getDownloadURL();
      // userse.updateProfile(photoURL: url, displayName: name);
      // userse.reload();

      FirebaseFirestore.instance.collection('users').doc(_uid).set({
        'id': _uid,
        'email': email,
        'name': name,
        'fullName': completeName,
        'noTelp': noTelp,
        // 'imageUrl' : url,
      });

      return userse;
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
