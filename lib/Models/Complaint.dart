import 'package:cloud_firestore/cloud_firestore.dart';

class Complaint {
  final String id;
  final String photoUrl;
  final String userId;
  final String description;
  final String location;
  final Timestamp createTime;

  Complaint(
      {this.id,
      this.photoUrl,
      this.userId,
      this.description,
      this.location,
      this.createTime});

  factory Complaint.createDocument(DocumentSnapshot doc) {
    return Complaint(
      id: doc.id,
      userId: doc.data()["userId"],
      photoUrl: doc.data()["photoUrl"],
      description: doc.data()["description"],
      location: doc.data()["location"],
      createTime: doc.data()["createTime"],
    );
  }
}
