import 'package:cloud_firestore/cloud_firestore.dart';

class PostData {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  static Future<void> createUser(
    String fullName,
    String noTelp,
    String email,
  ) async {
    await userCollection.doc().set({
      'fullName': fullName,
      'noTelp': noTelp,
      'email': email,
    });
  }
}
