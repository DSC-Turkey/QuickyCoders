import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Users {
  final String id;
  final String kullaniciAdi;
  final String fotourl;
  final String email;
  final String hakkinda;

  Users({this.id, this.kullaniciAdi, this.fotourl, this.email, this.hakkinda});

  factory Users.productFromFirebase(User users) {
    return Users(
      id: users.uid,
      kullaniciAdi: users.displayName,
      fotourl: users.photoURL,
      email: users.email,
    );
  }

  factory Users.createDocument(DocumentSnapshot doc) {
    return Users(
      id: doc.id,
      kullaniciAdi: doc.data()['kullaniciAdi'],
      email: doc.data()['email'],
      fotourl: doc.data()['fotoUrl'],
      hakkinda: doc.data()['hakkinda'],
    );
  }
}
