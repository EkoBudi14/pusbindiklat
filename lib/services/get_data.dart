import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetData {
  static CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  static Future<DocumentSnapshot> getUser(String id) async {
    return await userCollection.doc(id).get();
  }
}
