import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String email;
  String fullName;
  String noTelp;

  Users({
    this.email,
    this.fullName,
    this.noTelp,
  });

  factory Users.fromDocument(DocumentSnapshot doc) {
    return Users(
      email: doc.data()['email'],
      fullName: doc.data()['fullname'],
      noTelp: doc.data()['noTelp']
    );
  }
}
