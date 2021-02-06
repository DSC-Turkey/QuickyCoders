import 'package:cloud_firestore/cloud_firestore.dart';

class HistoricalArtifacts {
  final String id;
  final String photoUrl;
  final String userId;
  final String description;
  final String location;
  final Timestamp createTime;

  HistoricalArtifacts(
      {this.id,
      this.userId,
      this.photoUrl,
      this.description,
      this.location,
      this.createTime});

  factory HistoricalArtifacts.createDocument(DocumentSnapshot doc) {
    return HistoricalArtifacts(
      id: doc.id,
      userId: doc.data()["userId"],
      photoUrl: doc.data()["photoUrl"],
      description: doc.data()["description"],
      location: doc.data()["location"],
      createTime: doc.data()["createTime"],
    );
  }
}
