import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Users {
  final String id;
  final String userName;
  final String photoUrl;
  final String email;
  final String detail;

  Users({this.id, this.userName, this.photoUrl, this.email, this.detail});

  factory Users.productFromFirebase(User users) {
    return Users(
      id: users.uid,
      userName: users.displayName,
      photoUrl: users.photoURL,
      email: users.email,
    );
  }

  factory Users.createDocument(DocumentSnapshot doc) {
    return Users(
      id: doc.id,
      userName: doc.data()['userName'],
      email: doc.data()['email'],
      photoUrl: doc.data()['fotoUrl'],
      detail: doc.data()['detail'],
    );
  }
}
